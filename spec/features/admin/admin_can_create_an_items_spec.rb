require 'rails_helper'

RSpec.feature "AdminCanCreateAnItems", type: :feature do
  context "creating gnomes as admin" do

  it "add items logged in as an admin" do
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "Pickle-hero"
    fill_in "Desc", with: "A small one"
    fill_in "Price", with: "1.00"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option').select_option

    click_on "Create item"

    expect(page).to have_content("Pickle-hero")
    expect(page).to have_content("A small one")
    expect(page).to have_content("1")
    expect(page).to have_css('#gnome-image')
  end

  it "must have a name" do
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: ""
    fill_in "Desc", with: "something"
    fill_in "Price", with: "1.00"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option').select_option

    click_on "Create item"

    expect(page).to have_content("Invalid entry")
  end

  it "must have a description" do
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "Pickle-hero"
    fill_in "Desc", with: ""
    fill_in "Price", with: "1.00"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option').select_option

    click_on "Create item"

    expect(page).to have_content("Invalid entry")
  end

  it "must have a price besides 0" do
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "expensive"
    fill_in "Desc", with: "something"
    fill_in "Price", with: "0"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option').select_option

    click_on "Create item"

    expect(page).to have_content("Invalid entry")
  end

  it "must be formated correctly for price" do
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "expensive"
    fill_in "Desc", with: "something"
    fill_in "Price", with: "0.000"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option').select_option

    click_on "Create item"

    expect(page).to have_content("Invalid entry")
  end

  it "must be a unique item" do
    gnome = create(:gnome)
    login_as_admin

    visit admin_dashboard_path

    click_on "Add item"

    fill_in "Name", with: "#{gnome.name}"
    fill_in "Desc", with: "#{gnome.desc}"
    fill_in "Price", with: "#{gnome.price}"

    find('#gnome_category').find(:xpath, '//*[@id="gnome_category"]/option[1]').select_option

    click_on "Create item"

    expect(page).to have_content("Invalid entry")
  end
end

  def login_as_admin
    admin = create(:user, :role => 1)
    category = create(:category)
    page.set_rack_session(:user_id => admin.id)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    within(".login-form") do
      click_on "Login"
    end
  end
end
