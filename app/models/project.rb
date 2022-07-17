class Project < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, presence: true, length: { minimum: 3, maximum: 250}

end
