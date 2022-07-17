class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  after_initialize :set_sort
  validates :name, presence: true, length: { minimum: 3, maximum: 250}
  validates :date, presence: true
  validate :date_is_date?
  validates :time, presence: true, format: { with: /(2[0-3]|[01]?[0-9]):([0-5]?[0-9])/, message: "time is not valid" }
  validates :sort, presence: true

  private

  def set_sort
    Task.maximum(:sort).nil? ? sort = 0  : sort = Task.maximum(:sort).next.to_i
  end

  def date_is_date?
    if !date.is_a?(Date)
      errors.add(:date, 'must be a valid date') 
    end
  end

end
