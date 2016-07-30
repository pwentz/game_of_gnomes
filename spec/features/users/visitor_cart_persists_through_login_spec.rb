require 'rails_helper'

describe 'Visitor cart items can persist into login' do
  scenario 'they see login or create account instead of checkout' do
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:bucket => {gnome_one.id => 1,
                                      gnome_two.id => 1})

    visit gnomes_path

    within(".navbar") do
      click_link 'View bucket'
    end

    expect(page).to have_content("Login or Create Account to checkout")
    expect(page).not_to have_button("Checkout")
  end

  scenario 'they see the same items in the bucket after they create an account' do
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:bucket => {gnome_one.id => 1,
                                      gnome_two.id => 1})

    visit bucket_path

    click_link "Create Account"

    fill_in "Username", with: "Alan"
    fill_in "Password", with: "password"
    click_on "Create Account"

    within(".navbar") do
      click_link 'View bucket'
    end

    expect(page).to have_button("Checkout")

    within("#gnome_#{gnome_one.id}") do
      expect(page).to have_link(gnome_one.name)
    end

    within("#gnome_#{gnome_two.id}") do
      expect(page).to have_link(gnome_two.name)
    end
  end
end
