require 'rails_helper'

describe 'Visitor sees login and create account', :type => :feature do
  scenario "when visitor clicks login from the root they are see the login page" do

    visit "/"

    within(".navbar") do
      click_on 'Login'
    end

    expect(current_path).to eq '/login'
  end

  scenario "when the visitor visit the login page can login or create account" do

    visit '/login'

    within("fieldset") do
      expect(page).to have_link("Create Account")
      expect(page).to have_link("Login")
    end
  end
end
