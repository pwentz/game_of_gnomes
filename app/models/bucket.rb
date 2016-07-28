class Bucket
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_gnome(gnome)
    contents[gnome.id.to_s] ||= 0
    contents[gnome.id.to_s] += 1
  end

  def populated_contents
    contents.reduce({}) do |result, pair|
      result.merge!(Gnome.find(pair.first) => pair.last)
    end
  end

  def total
    populated_contents.sum { |gnome, quantity| gnome.price.to_f * quantity }.round(2)
  end

  def subtotal(gnome_subtotal)
    (gnome_subtotal[:gnome].price * gnome_subtotal[:quantity]).round(2)
  end

  def adjust_gnome_quantity(increase, gnome_id)
    if increase == "true"
      increase_gnome_quantity(gnome_id)
    else
      reduce_gnome_quantity(gnome_id)
    end
  end

  def increase_gnome_quantity(gnome_id)
    contents[gnome_id] += 1
  end

  def reduce_gnome_quantity(gnome_id)
    contents[gnome_id] -= 1
    contents.delete(gnome_id) if contents[gnome_id].zero?
  end

end
