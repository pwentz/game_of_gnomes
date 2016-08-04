class Gnome < ActiveRecord::Base
  belongs_to :category
  has_many :order_gnomes
  has_many :orders, through: :order_gnomes

  validates :name, presence: true,
                   uniqueness: true

  validates :desc, presence: true

  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  validates_numericality_of :price, :greater_than => 0

  validates :category_id, :presence => true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
  default_url: "images/gnome.png"


  enum role: %w(default retired)

  after_create do
    self.role = 0
  end
end
