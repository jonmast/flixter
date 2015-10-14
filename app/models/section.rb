class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  validates :title, presence: true
  validates :course, associated: true
end
