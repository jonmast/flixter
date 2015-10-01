class Course < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
