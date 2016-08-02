require 'rails_helper'

RSpec.feature "AdminCanCreateAnItems", type: :feature do
  it "add items logged in as an admin" do

    admin = create(:user, :role => 1)
    page.set_rack_session(:user_id => admin.id)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    within(".login-form") do
      click_on "Login"
    end

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "Pickle-hero"
    fill_in "Desc", with: "A small one"
    fill_in "Price", with: "1.00"
    fill_in "Category", with: "small"
    # attach_file "File", "spec/asset_specs/photos/photo.jpg"

    click_on "Create item"

    expect(page).to have_content("Pickle-hero")
    expect(page).to have_content("A small one")
    expect(page).to have_content("1")
    expect(page).to have_css('#gnome-image')
  end
end
