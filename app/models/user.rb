class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :country_code, presence: true
  validates :phone_number, presence: true

  enum role: %w(default admin)
end
