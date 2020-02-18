class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def new
  end

  def create
    portfolio = Portfolio.new(portfolio_params)
    if portfolio.save
      flash[:success] = "#{portfolio.name} Has Been Created"
      redirect_to '/portfolios'
    else
      flash[:error] = portfolio.errors.full_messages.to_sentence
      render :new
    end
  end

    def edit
      @portfolio = Portfolio.find(params[:portfolio_id])
    end

    def update
      portfolio = Portfolio.find(params[:portfolio_id])
      portfolio.update(portfolio_params)
      if portfolio.save
        flash[:success] = "Changes Saved"
        redirect_to "/portfolios/#{portfolio.id}"
      else
        flash[:error] = portfolio.errors.full_messages.to_sentence
        redirect_to "/portfolios/#{portfolio.id}/edit"
      end
    end

  private

  def portfolio_params
    params.permit(:name, :description)
  end
end
