require 'rails_helper'

describe 'Admin cannot modify user data', :type => :feature do
  scenario 'and sees something' do
    admin = User.create(username: 'Alan', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
