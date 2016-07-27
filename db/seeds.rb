# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
8.times do
  Gnome.create(name: Faker::GameOfThrones.character, price: Faker::Commerce.price,
               desc: Faker::Lorem.sentence)
end

3.times do
  Category.create(name: Faker::Commerce.color.capitalize)
end

Category.first.gnomes << Gnome.first(3)
Category.second.gnomes << Gnome.all[3..5]
Category.third.gnomes << Gnome.last(2)
