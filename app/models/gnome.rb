class Gnome < ActiveRecord::Base
  belongs_to :category
  has_many :gnome_orders 
  has_many :orders, through: :gnome_orders
end
