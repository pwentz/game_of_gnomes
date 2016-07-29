class OrderGnome < ActiveRecord::Base
  belongs_to :gnome
  belongs_to :order
  after_create :set_subtotal

  def set_subtotal
    unless quantity.zero?
      update_attribute(:subtotal, gnome.price * quantity)
    end
  end
end
