require 'rails_helper'

describe "User cannot view admin dashboard", :type => :feature do
  scenario "and sees a 404 error" do
    user = User.create(username: 'Tim', password: 'password', role: 0)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Login"

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
