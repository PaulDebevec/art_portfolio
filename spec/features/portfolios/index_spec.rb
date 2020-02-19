require 'rails_helper'

describe 'Portfolio Index Page', type: :feature do
  describe 'As a visitor' do
    it "Shows the name of each portfolio in the system" do
      portfolio_1 = Portfolio.create!(name: "Traditional")
      portfolio_2 = Portfolio.create!(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'
      expect(page).to have_content("Portfolio Index")

      within "#portfolio-#{portfolio_1.id}" do
        expect(page).to have_content("Traditional")
        expect(page).not_to have_content("Delete Portfolio")
        expect(page).not_to have_content("Edit #{portfolio_1.name} Portfolio Info")

      end

      within "#portfolio-#{portfolio_2.id}" do
        expect(page).to have_content("Digital")
        expect(page).to have_content("This portfolio consists of digital artwork")
        expect(page).not_to have_content("Delete Portfolio")
        expect(page).not_to have_content("Edit #{portfolio_2.name} Portfolio Info")
      end
    end
  end
end
