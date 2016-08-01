require 'rails_helper'

RSpec.describe OrderGnome, type: :model do
  context 'associations' do
    it { should belong_to(:gnome) }
    it { should belong_to(:order) }
  end

  it 'should return subtotal' do
    pending 
  end
end
