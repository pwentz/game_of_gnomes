require 'rails_helper'

# Background: My cart has an item in it
# As a visitor
# When I visit "/cart"
# And I click link "Remove"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the visitorgc wants to add it back
# And I should not see the item listed in cart

describe "visitor can remove item from cart", :type => :feature do
  context "visitor has one of each item and removes 1" do
    scenario "and visitor sees cart with item removed" do

      gnome, gnome_two, gnome_three = create_list(:gnome, 3)
      page.set_rack_session(:bucket => {gnome.id => 1,
                                        gnome_two.id => 1,
                                        gnome_three.id => 1})

      visit bucket_path

      within("#gnome_#{gnome.id}") do
        click_link 'Remove from cart'
      end

      within(".gnome_bucket") do
        expect(page).not_to have_content(gnome.name)
      end

      within(".flash_success") do
        expect(page).to have_link(gnome.name)
      end
    end
  end
end
