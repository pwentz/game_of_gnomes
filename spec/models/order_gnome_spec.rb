require 'rails_helper'

RSpec.describe OrderGnome, type: :model do
  context 'associations' do
    it { should belong_to(:gnome) }
    it { should belong_to(:order) }
  end

  it 'should return subtotal' do
    gnome_price = 5.95
    quantity = 2
    gnome = create(:gnome, :price => gnome_price)
    order_gnome = OrderGnome.create(:gnome_id => gnome.id,
                                    :quantity => quantity)
    expected_result = (gnome_price * quantity)
    
    expect(order_gnome.subtotal).to eq(expected_result)
  end
end
