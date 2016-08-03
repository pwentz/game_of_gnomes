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

    it "must have a price" do
      gnome = Gnome.create(:price => 0)

      expect(gnome.valid?).to eq(false)
    end

    it "will only accept correct format" do
      gnome = Gnome.create(:price => "1.00")

      expect(gnome.valid?).to eq(false)
    end

    it "must be correctly formatted" do
      gnome = Gnome.create(:price => 0.000)

      expect(gnome.valid?).to eq(false)
    end

    it "has a description" do
      gnome = Gnome.new(:desc => "High-quality gnome")

      expect(gnome.desc).to eq("High-quality gnome")
    end


    it "has a default image" do
      gnome = Gnome.create(:price => 0.000)

      expect(gnome.image).to be_truthy
    end

    it "has a default role" do
      category = Category.create(:name => "Breaking")
      gnome = category.gnomes.new(
      name: "bill",
      desc: "nothing",
      price: 10.00,
      :price => 1.00)

      category.gnomes << gnome
      expect(gnome.role).to eq("default")
    end

    context "associates" do
      it "has a category id" do
        category = Category.create(:name => "Breaking")
        gnome = Gnome.new(:category_id => "#{category.id}")

        category.gnomes << gnome
        expect(gnome.category.id).to eq(category.id)
      end
    end
  end
end
