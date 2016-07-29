class BucketGnome < SimpleDelegator
  attr_reader :quantity, :gnome, :gnome_key
  def initialize(gnome, quantity=nil)
    @gnome = Gnome.find(gnome)
    @quantity = quantity
    @gnome_key = @gnome.id.to_s
    super(@gnome)
  end

  def subtotal
    price * quantity
  end

  def adjust_quantity(adjustment, bucket)
    if adjustment == "increase"
      bucket.contents[gnome_key] += 1
    else
      decrement(bucket)
    end
  end

  def decrement(bucket)
    if bucket.contents[gnome_key].zero?
      bucket.contents[gnome_key] = 0
    else
      bucket.contents[gnome_key] -= 1
    end
  end

end
