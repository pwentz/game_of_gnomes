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
    pending
    order = Order.create
    gnome = create(:gnome)
    order_gnomes = OrderGnome.new(gnome_id: gnome.id, order_id: order.id, quantity: 60, subtotal: gnome.price)

    expect().to eq(gnome.price * order_gnomes.quantity)
  end
end
