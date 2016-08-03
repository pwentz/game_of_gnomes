require 'rails_helper'

describe 'Visitor can see gnomes', :type => :feature do
  scenario 'and they can see their information' do
    category = Category.create(name: "hi")
    gnome = Gnome.new(name: Faker::GameOfThrones.character,
                         price: 10.00,
                         desc: Faker::Lorem.sentence)

    category.gnomes << gnome
    visit gnomes_path

    expect(page).to have_content(gnome.name)
    expect(page).to have_content(gnome.price)
  end
end
