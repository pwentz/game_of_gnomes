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
    contents.map do |gnome, quantity|
      BucketGnome.new(gnome, quantity)
    end
  end

  def total
    populated_contents.sum { |gnome| gnome.price * gnome.quantity }.to_f
  end

  def empty?
    contents.empty?
  end
end
