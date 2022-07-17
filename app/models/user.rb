class User < ApplicationRecord
  has_secure_password
  has_many :projects
  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 50}, format: { without: /\s/ }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end
