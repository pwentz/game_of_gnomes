require 'rails_helper'
#As a user, 
#if I visit an item page,
#and that item has been retired,
#then I should still be able to access item page
#and I should not be able to add the item to my cart
#and I should see in place of the "Add to Cart" button - "Item retired"

describe 'User cannot check out a retired gnome' do
  scenario "they instead see 'Item retired' in it's place" do
    gnome = create(:gnome, :role => 1)

    visit gnome_path(gnome)

    expect(page).not_to have_button('Add to bucket')
    expect(page).to have_content('Item retired')
  end
end
