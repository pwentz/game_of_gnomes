require 'rails_helper'
#Background: My cart has an item in it,
#When I visit '/cart'
#then I should see my item with a quantity of 1
#and when I increase the quantity
#then my current page should be '/cart'
#And that item's quantity should reflect the increase
#and the subtotal for that item should increase
#and the total for the cart should match that increase
#and when I decrease the quantity
#then my current page should be '/cart'
#and that item's quantity should reflect the decrease
#and the subtotal for that item should decrease
#and the total for the cart should match that decrease

describe 'Visitor can adjust quantity of items in cart' do

  scenario 'and they can increase the quantity from /bucket' do
    gnome = create(:gnome)
    visit gnome_path(gnome)
    click_button 'Add to bucket'

    visit '/bucket'

    within("#gnome_#{gnome.id}") do
      click_link 'Increase quantity'
    end

    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Total price: $#{gnome.price * 2}")
    expect(current_path).to eq('/bucket')
  end

  scenario 'and they can remove the quantity and see the price differences' do
    gnome_one, gnome_two = create_list(:gnome, 2)

    visit gnome_path(gnome_one)
    click_button 'Add to bucket'
    click_button 'Add to bucket'

    visit gnome_path(gnome_two)
    click_button 'Add to bucket'

    visit '/bucket'

    within("#gnome_#{gnome_one.id}") do
      click_link "Remove from cart"
    end

    within("#gnome_#{gnome_one.id}") do
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $#{gnome_one.price}")
    end

    expect(page).to have_content("Total price: $#{gnome_one.price + gnome_two.price}")
    expect(current_path).to eq("/bucket")
  end
end
