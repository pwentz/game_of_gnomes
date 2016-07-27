require 'rails_helper'

describe 'Visitor can create an account', :type => :feature do
  scenario "when visitor clicks 'Create Account' they see form" do

    visit "/login"

    click_on 'Create Account'

    fill_in "Username", with: "Alan"
    fill_in "Password", with: "password"
    click_on "Create Account"

    expect(current_path).to eq '/dashboard'
    expect(page).to have_content("Welcome, Alan")
    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
  end
end
