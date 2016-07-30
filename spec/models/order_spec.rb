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
end
