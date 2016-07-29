class Gnome < ActiveRecord::Base
  belongs_to :category
  has_many :order_gnomes 
  has_many :orders, through: :order_gnomes

end
