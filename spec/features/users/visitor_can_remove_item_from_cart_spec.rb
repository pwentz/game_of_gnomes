require 'rails_helper'

describe "visitor can remove item from cart", :type => :feature do
  context "visitor has one of each item and removes 1" do
    scenario "and visitor sees cart with item removed" do

      gnome, gnome_two, gnome_three = create_list(:gnome, 3)
      page.set_rack_session(:bucket => {gnome.id => 1,
                                        gnome_two.id => 1,
                                        gnome_three.id => 1})

      visit bucket_path

      within("/html/body/section/div/div/table/tbody/tr[1]/td[7]") do
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
