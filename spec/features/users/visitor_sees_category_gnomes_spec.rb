require 'rails_helper'

RSpec.feature "Visitor sees category gnomes", type: :feature do
  scenario "in the category show page" do
    category = create(:category)
    gnome = create(:gnome, :category => category)

    visit "/#{category.to_param}"
    expect(page).to have_content(gnome.name)
    expect(current_path).to eq("/#{category.name.parameterize}")
  end

  scenario "in the category show page, but not gnomes created without category" do
    category = create(:category)
    gnome = create(:gnome, :category => category)
    create(:gnome, name: "Gnome Chompski")

    visit "/#{category.to_param}"
    expect(page).not_to have_content("Gnome Chompski")
  end
end
