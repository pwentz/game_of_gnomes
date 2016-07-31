class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_gnomes
  has_many :gnomes, through: :order_gnomes
  enum status: %w(ordered paid completed cancelled)

  def add_contents(bucket_contents)
    bucket_contents.each do |gnome_id, quantity|
      order_gnome = self.order_gnomes.create(
        gnome_id: gnome_id,
        quantity: quantity)
    end
  end

  def updated?
    true unless ordered?
  end

  def total
    order_gnomes.to_a.sum { |order_gnome| order_gnome.subtotal.to_f }
  end

end
