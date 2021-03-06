class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates_presence_of :password, require: true

  enum role: %w(default admin)
end
