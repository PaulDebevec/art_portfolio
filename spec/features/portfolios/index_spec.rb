require 'rails_helper'

describe 'As a visitor' do
  describe 'Portfolio Index Page' do
    it "Shows the name of each portfolio in the system" do
      portfolio_1 = Portfolio.create!(name: "Traditional")
      portfolio_2 = Portfolio.create!(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'
      expect(page).to have_content("Portfolio Index")

      within "#portfolio-#{portfolio_1.id}" do
        expect(page).to have_content("Traditional")
      end

      within "#portfolio-#{portfolio_2.id}" do
        expect(page).to have_content("Digital")
        expect(page).to have_content("This portfolio consists of digital artwork")
      end
    end
  end
end
