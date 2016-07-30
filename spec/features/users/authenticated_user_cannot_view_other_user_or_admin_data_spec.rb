require 'rails_helper'

describe "Authenticated user cannot view other user or admin data", :type => :feature do
  scenario "when they visit the admin dashboard they see a 404 error" do
    user = create(:user)
    page.set_rack_session(:user_id => user.id)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
