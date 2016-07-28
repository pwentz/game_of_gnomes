require 'rails_helper'

describe "UserCanLogout", type: :feature do
  scenario "when user is logged in they see the logout button" do
    user = create(:user)

    page.set_rack_session(:user_id => user.id)

    visit gnomes_path

    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
  end

  scenario "when user is logged out they see the login button" do
    user = create(:user)

    page.set_rack_session(:user_id => user.id)

    visit gnomes_path

    click_link "Logout"

    expect(page).not_to have_link("Logout")
    expect(page).to have_link("Login")
  end
end
