class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_gnomes
  has_many :gnomes, through: :order_gnomes

  def add_contents(bucket_contents)
    bucket_contents.each do |gnome_id, quantity|
      order_gnome = self.order_gnomes.new(gnome_id: gnome_id)
      order_gnome.quantity = quantity
      order_gnome.save
    end
  end

  def updated?
    true unless status == "ordered"
  end

  def total
    order_gnomes.to_a.sum { |order_gnome| order_gnome.subtotal.to_f }
  end

  enum status: %w(ordered paid completed cancelled)
end
