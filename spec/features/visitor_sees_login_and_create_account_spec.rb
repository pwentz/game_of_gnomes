require 'rails_helper'

describe 'Visitor sees login and create account', :type => :feature do
  scenario "when visitor clicks login from the root they are see the login page" do

    visit "/"

    click_on 'Login'

    expect(current_path).to eq '/login'
  end

  scenario "when the visitor visit the login page can login or create account" do

    visit '/login'

    expect(page).to have_content("Create Account")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end
end
