require 'rails_helper'

describe 'Visitor can add items to bucket and view items in bucket' do
  scenario 'they can see an add to bucket button' do
    gnome = create(:gnome)

    visit gnome_path(gnome)

    expect(page).to have_button('Add to bucket')

    click_button 'Add to bucket'

    expect(current_path).to eq(gnome_path(gnome))
  end

  scenario 'and they see the gnome details of gnomes in bucket' do

    gnome, gnome_two = create_list(:gnome, 2)

    visit gnome_path(gnome)

    click_button 'Add to bucket'

    within(".navbar") do
      click_link "View bucket"
    end

    expect(page).to have_content(gnome.name)
    expect(page).to have_content(gnome.price)
    expect(page).to have_css("img[src=\"#{gnome.image_url}\"]")
    expect(page).not_to have_content(gnome_two.name)
  end

  scenario 'and they see all the gnomes details and the total in the bucket' do

    gnome, gnome_two, gnome_three = create_list(:gnome, 3)

    visit gnome_path(gnome)
    click_button 'Add to bucket'

    visit gnome_path(gnome_two)
    click_button 'Add to bucket'

    visit gnome_path(gnome_three)
    click_button 'Add to bucket'

    within(".navbar") do
      click_link "View bucket"
    end

    expect(page).to have_content(gnome.name)
    expect(page).to have_content(gnome_two.name)
    expect(page).to have_content(gnome_three.name)
  end

  scenario 'and they see all the gnomes details and the total in the bucket' do

    gnome, gnome_two, gnome_three = create_list(:gnome, 3)

    visit gnome_path(gnome)
    click_button 'Add to bucket'

    visit gnome_path(gnome_two)
    click_button 'Add to bucket'

    visit gnome_path(gnome_three)
    click_button 'Add to bucket'

    within(".navbar") do
      click_link "View bucket"
    end

    expected = gnome.price + gnome_two.price + gnome_three.price

    expect(page).to have_content(expected)
  end
end
