class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_gnomes
  has_many :gnomes, through: :order_gnomes
  enum status: %w(ordered paid completed cancelled)

  def updated?
    true unless ordered?
  end

  def total
    order_gnomes.to_a.sum { |order_gnome| order_gnome.subtotal.to_f }.round(2)
  end

end
