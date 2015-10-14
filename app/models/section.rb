class Section < ActiveRecord::Base
  belongs_to :course
  validates :title, presence: true
  validates :course, associated: true
end
