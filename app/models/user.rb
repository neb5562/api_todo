class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 50}, format: { without: /\s/ }
  validates :password_digest, presence: true, length: { minimum: 8 }
end
