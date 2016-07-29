require 'rails_helper'

describe "User can checkout items", :type => :feature do
  scenario "and they can view items in the orders view" do
    user = create(:user)
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome_one.id => 1})

    visit bucket_path

    click_button "Checkout"
    expect(page).to have_content("Order was successfully placed.")
    expect(page).to have_content("#{user.username}")

    within("table") do
      expect(page).to have_content(gnome_one.name)
      expect(page).to have_content("#{gnome_one.price}")
    end
  end
end
