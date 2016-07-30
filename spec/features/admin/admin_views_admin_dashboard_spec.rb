require 'rails_helper'

describe "Admin views dashboard", :type => :feature do
  scenario "and sees Admin Dashboard" do
    admin = User.create(username: 'Alan', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_on "Login"

    expect(page).to have_content("Admin Dashboard")
    expect(page).not_to have_content("Welcome, Alan")
  end
end
