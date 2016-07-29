class GnomeBucket < SimpleDelegator
  attr_reader :quantity, :gnome
  def initialize(gnome, quantity)
    @gnome = Gnome.find(gnome)
    @quantity = quantity
    super(@gnome)
  end

  def subtotal
    price * quantity
  end
end
