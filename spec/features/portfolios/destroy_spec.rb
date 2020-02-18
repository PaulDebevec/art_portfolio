require 'rails_helper'

describe 'Destroy Portfolio From Portfolio Index Page', type: :feature do
  describe 'As a visitor' do
    it "I see a link to destroy the portfolio and when I click this link the portfolio is deleted" do
      portfolio_1 = Portfolio.create(name: "Traditional")
      portfolio_2 = Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")
      portfolio_3 = Portfolio.create(name: "Random Sketches", description: "Random sketchwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_1.id}" do
        click_link "Delete Portfolio"
      end

      expect(current_path).to eq('/portfolios')
      expect(page).not_to have_content("Traditional")
      expect(page).to have_content("Portfolio Deleted")

      portfolio_first = Portfolio.first
      expect(portfolio_first.name).not_to eq("Traditional")
      expect(Portfolio.count).to eq(2)
    end

    it "I may delete a portfolio from it's show page" do
      portfolio_1 = Portfolio.create(name: "Traditional")
      portfolio_2 = Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")
      portfolio_3 = Portfolio.create(name: "Random Sketches", description: "Random sketchwork")

      visit "/portfolios/#{portfolio_3.id}"

      click_link "Delete Portfolio"

      expect(current_path).to eq('/portfolios')
      expect(page).not_to have_content("Random Sketches")
      expect(page).not_to have_content("Random sketchwork")
      expect(page).to have_content("Portfolio Deleted")

      portfolio_last = Portfolio.last
      expect(portfolio_last.name).not_to eq("Traditional")
      expect(Portfolio.count).to eq(2)
    end
  end
end
