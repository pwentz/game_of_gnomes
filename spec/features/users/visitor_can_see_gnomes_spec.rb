require 'rails_helper'

describe 'Visitor can see gnomes', :type => :feature do
  scenario 'and they can see their information' do
    gnome = Gnome.create(name: Faker::GameOfThrones.character,
                         price: Faker::Commerce.price,
                         desc: Faker::Lorem.sentence)

    visit gnomes_path

    expect(page).to have_content(gnome.name)
    expect(page).to have_content(gnome.price)
  end
end
