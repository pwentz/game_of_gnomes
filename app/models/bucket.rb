class Bucket
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_gnome(gnome)
    contents[gnome.id] ||= 0
    contents[gnome.id] += 1
  end

  def populated_contents
    contents.reduce({}) do |result, pair|
      result.merge!(Gnome.find(pair.first) => pair.last)
    end
  end

  def total
    populated_contents.keys.sum { |gnome| gnome.price.to_f }
  end
end
