require 'rails_helper'

describe 'Visitor can create an account', :type => :feature do
  scenario "when visitor clicks 'Create Account' they see form" do
    user = create(:user)

    visit login_path

    click_on 'Create New Account'
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Email address", with: user.email
    fill_in "Country code", with: user.country_code
    fill_in "Phone number", with: user.phone_number
    click_on "Create Account"

    expect(current_path).to eq users_path
  end
end
