require 'rails_helper'

describe 'Portfolio Show Page' do
  describe 'As a visitor' do
    it "When I visit '/portfolios/:portfolio_id' I see the portfolio's name and (optional) description" do
      portfolio_1 = Portfolio.create!(name: "Traditional")
      portfolio_2 = Portfolio.create!(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_1.id}" do
        click_link "#{portfolio_1.name}"
      end

      expect(current_path).to eq("/portfolios/#{portfolio_1.id}")
      expect(page).to have_content("Traditional")

      visit '/portfolios'

      within "#portfolio-#{portfolio_2.id}" do
        click_link "#{portfolio_2.name}"
      end

      expect(page).to have_content("Digital")
      expect(page).to have_content("This portfolio consists of digital artwork")
    end
  end
end