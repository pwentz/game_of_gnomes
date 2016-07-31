require 'rails_helper'

describe 'Visitor can adjust quantity of items in cart' do

  scenario 'and they can increase the quantity from /bucket' do
    gnome = create(:gnome)
    visit gnome_path(gnome)
    click_button 'Add to bucket'

    visit '/bucket'

    click_link 'Increase quantity'

    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("$#{gnome.price * 2}")
    expect(current_path).to eq('/bucket')
  end

  context 'they have multiple instances of item' do
    scenario 'and they can remove the quantity and see the price differences' do
      gnome_one, gnome_two = create_list(:gnome, 2)
      page.set_rack_session(:bucket => {gnome_one.id => 2,
                                     gnome_two.id => 1})


      visit bucket_path

      within(:path, '/html/body/section/div/div/table/tbody/tr[1]/td[5]') do
        click_link("Decrease quantity")
      end

        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("$#{gnome_one.price}")

      expect(page).to have_content("$#{gnome_one.price + gnome_two.price}")
      expect(current_path).to eq("/bucket")
    end
  end

  context 'they have 1 of an item left' do
    scenario 'the quantity cannot go below 0' do
      gnome = create(:gnome)
      page.set_rack_session(:bucket => {gnome.id => 1})

      visit bucket_path

      2.times do
        click_link("Decrease quantity")
      end

      expect(page).to have_content("Quantity: 0")

    end
  end
end
