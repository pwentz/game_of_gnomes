require 'rails_helper'

RSpec.describe Bucket, type: :model do
  it 'adds a gnome' do
    gnome = create(:gnome)

    bucket = Bucket.new(nil)

    expect(bucket.add_gnome(gnome)).to eq (1)
  end

  it 'populates the bucket contents' do
    gnome = create(:gnome)
    bucket = Bucket.new({gnome.id.to_s => 1})
    populated_contents_id = bucket.populated_contents.first.id

    expect(populated_contents_id).to eq(gnome.id)
  end

  it 'returns the total of the populated contents' do
    gnome = create(:gnome)
    bucket = Bucket.new({gnome.id.to_s => 2})
    quantity = bucket.contents[gnome.id.to_s]

    expect(bucket.total).to eq((gnome.price * quantity).to_f)
  end

  it 'checks to see if the contents are empty' do
    gnome = create(:gnome)
    bucket = Bucket.new({gnome.id.to_s => 2})

    expect(bucket.empty?).to eq false    
  end
end
