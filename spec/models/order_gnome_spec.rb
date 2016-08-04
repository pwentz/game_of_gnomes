require 'rails_helper'

describe OrderGnome, :type => :model do
  context 'associations' do
    it { should belong_to(:gnome) }
    it { should belong_to(:order) }
  end

  it 'should return subtotal' do
    gnome_price = 9.99
    gnome_quantity = 3
    gnome = create(:gnome, price: gnome_price)

    order_gnome = create(:order_gnome, :quantity => gnome_quantity,
                                       :gnome_id => gnome.id)
    expected_result = gnome_price * gnome_quantity

    expect(order_gnome.subtotal).to eq(expected_result)
  end
end
