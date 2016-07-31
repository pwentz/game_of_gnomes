class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  enum role: %w(default admin)
end
