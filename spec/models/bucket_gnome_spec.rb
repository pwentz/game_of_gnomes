require 'rails_helper'

describe BucketGnome, :type => :model do
  it 'calculates subtotal' do
    gnome = create(:gnome)
    gnome_quantity = 3
    bucket_gnome = BucketGnome.new(gnome.id, 3)
    expected_result = gnome.price * gnome_quantity

    expect(bucket_gnome.subtotal).to eq(expected_result)
  end

  it 'can increase quantity' do
    gnome = create(:gnome)
    gnome_quantity = 3
    gnome_key = gnome.id.to_s
    bucket = Bucket.new(gnome_key => gnome_quantity)
    bucket_gnome = BucketGnome.new(gnome.id, gnome_quantity)
    adjustment = 'increase'

    expect{
      bucket_gnome.adjust_quantity(adjustment, bucket)
    }.to change{ bucket.contents[gnome_key] }.from(3).to(4)
  end

  it 'can increase quantity' do
    gnome = create(:gnome)
    gnome_quantity = 3
    gnome_key = gnome.id.to_s
    bucket = Bucket.new(gnome_key => gnome_quantity)
    bucket_gnome = BucketGnome.new(gnome.id, gnome_quantity)
    adjustment = 'decrease'

    expect{
      bucket_gnome.adjust_quantity(adjustment, bucket)
    }.to change{ bucket.contents[gnome_key] }.from(3).to(2)
  end
end
