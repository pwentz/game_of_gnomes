require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:order_gnomes) }
    it { should have_many(:gnomes).through(:order_gnomes) }
  end

end
