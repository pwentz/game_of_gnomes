require 'rails_helper'

RSpec.feature "AdminCanEditAnItems", type: :feature do
  scenario "admin can edit gnomes" do

      gnome = create(:gnome)
      admin = create(:user, :role => 1)
      page.set_rack_session(:user_id => admin.id)

      visit login_path

      fill_in "Username", with: admin.username
      fill_in "Password", with: admin.password

      within(".login-form") do
        click_on "Login"
      end

      visit admin_dashboard_path

      click_on "#{gnome.name}"

      fill_in "Price", with: "100"

      click_on "Update Gnome"

      expect(page).to have_content("$100")
  end
end
