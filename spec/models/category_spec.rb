require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
      it 'should not validate names with anything but alphanumeric' do
        should_not allow_values("C&P", "T*R", "P@", "O!", ":>?").for(:name)
      end
  end

  context 'associations' do
    it { should have_many(:gnomes) }
  end

  it 'can turn name to vanity-url' do
    category = create(:category, :name => "Best Sellers")

    expect(category.to_param).to eq("best-sellers")
  end

  it 'can retrieve category from simple vanity url' do
    category = create(:category, :name => 'On Sale')

    expect(
      Category.find_by_name('on-sale')
    ).to eq(category)
  end

  it 'can retrieve category w/ particular name from url' do
    category = create(:category, :name => 'wIlD cR8ZeE Gn0mes')

    expect(
      Category.find_by_name('wild-cr8zee-gn0mes')
    ).to eq(category)
  end

end
