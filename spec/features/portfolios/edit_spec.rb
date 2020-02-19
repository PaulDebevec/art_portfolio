require 'rails_helper'

describe 'Portfolio Edit Page', type: :feature do
  describe 'As a visitor' do
    before :each do
      @admin = User.create( username: "admin",
                            password: "password",
                            role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it "On the portfolio index page, I see a link to 'Edit', when clicked I see a form to edit the portfolio" do
      portfolio_1 = Portfolio.create(name: "Traditional")
      portfolio_2 = Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_1.id}" do
        click_link "Edit #{portfolio_1.name} Portfolio Info"
      end

      expect(current_path).to eq("/portfolios/#{portfolio_1.id}/edit")

      fill_in :description, with: 'This collection consists of traditional artwork'
      click_on 'Submit Changes'

      expect(current_path).to eq("/portfolios/#{portfolio_1.id}")
      expect(page).to have_content("Changes Saved")
      expect(page).to have_content('Traditional')
      expect(page).to have_content('This collection consists of traditional artwork')
    end

    it "I see a link to edit a portfolio from it's show page" do
      portfolio_1 = Portfolio.create(name: "Traditional")
      portfolio_2 = Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")

      visit "/portfolios/#{portfolio_2.id}"

      click_link "Edit #{portfolio_2.name} Portfolio Info"
      expect(current_path).to eq("/portfolios/#{portfolio_2.id}/edit")
    end

    it "Displays a flash message when I fail to enter the portfolio name" do
      portfolio_1 = Portfolio.create(name: "Traditional")
      portfolio_2 = Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")

      visit '/portfolios'

      within "#portfolio-#{portfolio_2.id}" do
        click_link "Edit #{portfolio_2.name} Portfolio Info"
      end

      fill_in :name, with: ''
      click_on 'Submit Changes'

      expect(page).to have_content("Name can't be blank")
    end
  end
end
