require 'rails_helper'
#As a visitor,
  #When I visit any page with an item on it,
  #I should see a link of button for "Add to Cart",
  #When I click "Add to Cart" for that item,
  #And I click a link or button to view cart
#And my current path should be "/cart"
#And I should see a small image, title, description, and price for the item I just added
#And there should be a "total" price for the cart that should be the sum of all items in the cart

describe 'Visitor can add items to cart and view items in cart' do
  scenario 'they can see an add to bucket button' do
    gnome = create(:gnome)

    visit gnome_path(gnome)

    expect(page).to have_button('Add to bucket')
  end

  scenario 'and they are redirected to bucket path' do
    
    gnome = create(:gnome)

    visit gnome_path(gnome)

    click_button 'Add to bucket'

    expect(current_path).to eq('/gnomes')
  end
end
