class Order < ActiveRecord::Base
  belongs_to :user
  has_many :gnome_orders
  has_many :gnomes, through: :gnome_orders
end
