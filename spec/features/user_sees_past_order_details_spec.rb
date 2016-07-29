require 'rails_helper'

describe "User sees past order details", :type => :feature do
  scenario "when user visits orders path" do
    user = create(:user)
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome_one.id => 1})

    visit bucket_path

    click_button "Checkout"

    click_on "View Order History"

    expect(page).to have_content(gnome_one.name)
    expect(page).to have_content(gnome_one.price)
    expect(page).to have_content("Order status: ordered")
    # expect(page).to have_content("Status: paid")
    # expect(page).to have_content("Time: xxxx")
  end

  scenario "and sees updated status and timestamp" do
    user = create(:user)
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome_one.id => 1})

    visit bucket_path

    click_button "Checkout"

    click_on "View Order History"

    expect(page).to have_content("Order status: paid")
    # expect(page).to have_content("Time: xxxx")
  end
end

# And when I click that link
# Then I should see each item that was order with the quantity and line-item subtotals
# And I should see links to each item's show page
# And I should see the current status of the order (ordered, paid, completed, cancelled)
# And I should see the total price for the order
# And I should see the date/time that the order was submitted
# If the order was completed or cancelled
# Then I should see a timestamp when the action took place
