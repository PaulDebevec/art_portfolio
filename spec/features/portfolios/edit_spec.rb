require 'rails_helper'

describe 'Portfolio Edit Page' do
  describe 'As a visitor' do
    it "On the portfolio index page, I see a link to 'Edit' and when I click this link I see a form to edit the portfolio" do
      portfolio_1 = Portfolio.create!(name: "Traditional")
      portfolio_2 = Portfolio.create!(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_1.id}" do
        click_link "Edit Portfolio Info"
      end

      expect(current_path).to eq("/portfolios/#{portfolio_1.id}/edit")

      fill_in :description, with: 'This collection consists of traditional artwork'
      click_on 'Submit Changes'

      expect(current_path).to eq("/portfolios/#{portfolio_1.id}")
      expect(page).to have_content('Traditional')
      expect(page).to have_content('This collection consists of traditional artwork')
    end

    it "Displays a flash message when I fail to enter the portfolio name" do
      portfolio_1 = Portfolio.create!(name: "Traditional")
      portfolio_2 = Portfolio.create!(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_2.id}" do
        click_link "Edit Portfolio Info"
      end

      fill_in :name, with: ''
      click_on 'Submit Changes'

      expect(page).to have_content("Name can't be blank")
    end
  end
end