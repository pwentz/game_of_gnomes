require 'rails_helper'

describe "User sees checkout button", :type => :feature do
  context "when item is added to cart" do
    scenario "they see the see checkout button" do
      user = create(:user)
      gnome = create(:gnome)
      page.set_rack_session(user_id: user.id, :bucket => {gnome.id => 1})

      visit bucket_path

      expect(page).to have_button("Checkout")
    end
  end
  context "before item is added to cart" do
    scenario "they do not see the see checkout button" do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      visit bucket_path

      expect(page).not_to have_button("Checkout")
      expect(page).to have_content("Your bucket is empty!")
    end
  end
end
