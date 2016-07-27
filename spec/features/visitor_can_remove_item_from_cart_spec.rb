require 'rails_helper'

# Background: My cart has an item in it
# As a visitor
# When I visit "/cart"
# And I click link "Remove"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart

describe "User can remove item from cart", :type => :feature do
  context "user has 3 items in cart and removes 1" do
    scenario "and user sees cart with item removed" do

      gnome = create(:gnome)
      create_list(:gnome, 2)

      visit gnome_path(gnome)

      click_button 'Add to bucket'
      click_button 'Add to bucket'
      click_button 'Add to bucket'

      click_link "View bucket"

      within("#gnome_#{gnome.id}") do
        click_link 'Remove from cart'
      end
      expect(page).to have_content("Quantity: 2")
    end
  end

  context "user has 3 items in cart and removes 1" do
    scenario "and user sees cart with item removed" do

      gnome, gnome_two, gnome_three = create_list(:gnome, 3)

      visit gnome_path(gnome)

      click_button 'Add to bucket'

      visit gnome_path(gnome_two)

      click_button 'Add to bucket'

      visit gnome_path(gnome_three)

      click_button 'Add to bucket'

      click_link "View bucket"

      within("#gnome_#{gnome.id}") do
        click_link 'Remove from cart'
      end

      within("ul") do
        expect(page).not_to have_content(gnome.name)
      end

      within(".flash_success") do
        expect(page).to have_link(gnome.name)
      end
    end
  end
end
