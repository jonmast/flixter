class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections, dependent: :destroy
  validates :title, :description, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
