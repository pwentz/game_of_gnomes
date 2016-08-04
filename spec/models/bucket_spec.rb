require 'rails_helper'

describe Bucket, :type => :model do
  it 'adds a gnome' do
    gnome = create(:gnome)
    bucket = Bucket.new(nil)

    expect{
      bucket.add_gnome(gnome)
    }.to change{ bucket.contents.count }.from(0).to(1)
  end

  it 'populates contents' do
    gnome = create(:gnome)
    bucket = Bucket.new(gnome.id => 1)
    expected_result = bucket.populated_contents.first

    expect(
      expected_result
    ).to be_instance_of(BucketGnome)
  end

  it 'calculates total price' do
    gnome_one,
     gnome_two = create_list(:gnome, 2)
    bucket = Bucket.new(gnome_one.id => 1,
                        gnome_two.id => 1)
    expected_result = gnome_one.price + gnome_two.price

    expect(bucket.total).to eq(expected_result)
  end

  it 'calculates total quantity' do
    gnome_one,
      gnome_two = create_list(:gnome, 2)
    bucket_contents = {gnome_one.id => 3, gnome_two.id => 2}
    bucket = Bucket.new(bucket_contents)

    expect(bucket.total_quantity).to eq(5)
  end
end
