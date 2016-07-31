require 'rails_helper'

describe "User cannot view admin dashboard", :type => :feature do
  scenario "and sees a 404 error" do
    user = create(:user)
    page.set_rack_session(:user_id => user.id)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario 'and when an unregistered user visits admin dashboard they get a 404' do
    user = create(:user)
    page.set_rack_session(:user_id => user.id)
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
