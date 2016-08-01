require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:order_gnomes) }
    it { should have_many(:gnomes).through(:order_gnomes) }
  end

  it 'should populate contents' do
    order = Order.create
    gnome = create(:gnome)
    bucket_contents = {gnome.id => 1}

    expect{
      order.add_contents(bucket_contents)
    }.to change{order.order_gnomes.count}.from(0).to(1)
  end

  it 'should return the order total' do
    order = create(:order)
    gnome_price = 10.99
    gnome_quantity = 60
    gnome = create(:gnome, :price => gnome_price)
    order_gnomes = order.order_gnomes.create(gnome_id: gnome.id,
                                             quantity: gnome_quantity)
    expected_result = (gnome_price * gnome_quantity)

    expect(order.total).to eq(expected_result)
  end
end
