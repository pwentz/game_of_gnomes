require 'rails_helper'

RSpec.feature "UserSeesCategoryGnomes", type: :feature do
  scenario "in the category show page" do
    category = Category.create(name: "Scary")
    category.gnomes.create(name: "Gnomeo")

    visit category_path(category)
    expect(page).to have_content("Gnomeo")
    expect(current_path).to eq("/categories/#{category.name.downcase}")
  end

  scenario "in the category show page, but not gnomes created without category" do
    category = Category.create(name: "Scary")
    category.gnomes.create(name: "Gnomeo")
    Gnome.create(name: "Gnome Chompski")

    visit category_path(category)
    save_and_open_page
    expect(page).not_to have_content("Gnome Chompski")
  end
end
