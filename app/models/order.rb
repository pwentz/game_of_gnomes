class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_gnomes
  has_many :gnomes, through: :order_gnomes
end
