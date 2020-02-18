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
  private

  def portfolio_params
    params.permit(:name, :description)
  end
end
