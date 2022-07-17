class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, uniqueness: true, presence: true, length: { minimum: 3, maximum: 250}

end
