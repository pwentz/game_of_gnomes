require 'rails_helper'

describe Gnome, :type => :model do
  context "attributes" do
    it "has a name" do
      gnome = Gnome.new(:name => 'Gnomeo')

      expect(gnome.name).to eq('Gnomeo')
    end

    it "has a price" do
      gnome = Gnome.new(:price => 9.99)

      expect(gnome.price).to eq(9.99)
    end

    it "has a description" do
      gnome = Gnome.new(:desc => "High-quality gnome")

      expect(gnome.desc).to eq("High-quality gnome")
    end
  end
end
