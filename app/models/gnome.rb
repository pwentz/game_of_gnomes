class Gnome < ActiveRecord::Base
  belongs_to :category
  has_many :order_gnomes 
  has_many :orders, through: :order_gnomes

  enum role: %w(default retired)

  after_create do
    self.role = 0
  end
end
