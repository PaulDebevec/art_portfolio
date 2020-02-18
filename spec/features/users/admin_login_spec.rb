require 'rails_helper'

RSpec.describe "Admin login Screen" do
  it "Logs me in as an Admin and routes me to the Admin Dashboard" do

    admin = User.create(username: "admin", password: "password")

    visit "/"

    click_on "Login"

    expect(current_path).to eq("/login")

    fill_in :username, with: "#{admin.username}"
    fill_in :password, with: "#{admin.password}"
    click_on "Log In"

    expect(current_path).to eq('/dashboard')

    expect(page).to have_content("Welcome, #{admin.username}!")
  end

  it "cannot log in with bad credentials" do
    admin = User.create(username: "admin", password: "password")

    visit "/"

    click_on "Login"

    fill_in :username, with: admin.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Sorry, your credentials are incorrect.")
  end

  it "admin can log out" do
    admin = User.create(username: "admin", password: "password")

    visit "/"

    click_on "Login"

    fill_in :username, with: admin.username
    fill_in :password, with: admin.password

    click_on "Log In"
    expect(current_path).to eq('/dashboard')

    visit '/'
    click_link "Log Out"

    expect(current_path).to eq('/')
    expect(page).to have_content('Login')
    expect(page).not_to have_content('Log Out')
  end
end
