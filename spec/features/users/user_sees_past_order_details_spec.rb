require 'rails_helper'

describe "User sees past order details", :type => :feature do
  scenario "when user visits orders path" do
    user = create(:user)
    gnome = create(:gnome)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome.id => 1})

    visit bucket_path

    click_button "Checkout"

    click_on 'View Order'

    expect(page).to have_content(gnome.name)
    expect(page).to have_content(gnome.price)
    expect(page).to have_content("Order status: ordered")
  end

  scenario "and sees when status changes and the update timestamp" do
    user = create(:user)
    gnome = create(:gnome)
    page.set_rack_session(:user_id => user.id, :bucket => {gnome.id => 1})
    order = create(:order, :user => user)

    order.update_attribute(:status, 1)

    visit order_path(order)

    expect(page).to have_content("Order status: paid")
    expect(page).to have_content("Order updated at:")
  end
end
