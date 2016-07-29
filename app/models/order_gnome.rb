class OrderGnome < ActiveRecord::Base
  belongs_to :gnome
  belongs_to :order
end
