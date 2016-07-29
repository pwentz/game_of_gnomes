require 'rails_helper'

# Background: An existing user and a cart with items
# As a visitor
# When I add items to my cart
# And I visit "/cart"
# And I click "Login or Register to Checkout"
# Then I should be required to login
# When I am logged in
# And I visit my cart
# And when I click "Checkout"
# Then the order should be placed
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table

describe "User can checkout items", :type => :feature do
  scenario "and they can view items in the orders view" do
    user = create(:user)
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome_one.id => 1})

    visit bucket_path

    click_button "Checkout"
    expect(page).to have_content("Order was successfully placed.")
    expect(page).to have_content("#{user.username}")

    # within("table") do
    #   expect(page).to have_content(gnome_one.name)
    #   expect(page).to have_content("Subtotal: #{gnome_one.price}")
    # end
  end
end
