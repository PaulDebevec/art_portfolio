require 'rails_helper'

RSpec.describe 'New Portfolio', type: :feature do
  describe "As an admin, when I visit the portfolio index I see a link for 'New Portfolio' and when I click the link" do
    before :each do
      @admin = User.create( username: "admin",
                            password: "password",
                            role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/portfolios'
    end

    it "Takes me to a form page where I may create a new portfolio" do
      click_link 'New Portfolio'

      expect(current_path).to eq('/portfolios/new')

      fill_in :name, with: 'Digital Art'
      fill_in :description, with: 'This collection consists of digital artwork'
      click_on 'Create Portfolio'

      expect(current_path).to eq('/portfolios')

      new_portfolio = Portfolio.last
      within "#portfolio-#{new_portfolio.id}" do
        expect(page).to have_content(new_portfolio.name)
        expect(page).to have_content(new_portfolio.description)
      end
    end

    it "A portfolio may be created without a description" do
      click_link 'New Portfolio'

      fill_in :name, with: 'Digital Art'
      click_on 'Create Portfolio'

      expect(current_path).to eq('/portfolios')

      new_portfolio = Portfolio.last

      within "#portfolio-#{new_portfolio.id}" do
        expect(page).to have_content(new_portfolio.name)
      end
    end
    it "A portfolio may not be created without a name and displays a flash message" do
      click_link 'New Portfolio'

      fill_in :name, with: ''
      click_on 'Create Portfolio'

      expect(page).to have_content("Name can't be blank")
    end
  end
end
