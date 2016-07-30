require 'rails_helper'

describe "Admin can login", :type => :feature do
  scenario "and is redirected to the admin dashboard" do
    admin = User.create(username: 'Alan', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_on "Login"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
