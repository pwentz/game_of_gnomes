require 'rails_helper'

describe "Unauthenticated user cannot view user or admin data", :type => :feature do
  scenario "when they visit the user dashboard they see a 404 error" do
    visit dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "when they visit the admin dashboard they see a 404 error" do
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
