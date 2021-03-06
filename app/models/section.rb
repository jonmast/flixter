class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  validates :title, presence: true
  validates :course, associated: true

  include RankedModel
  ranks :row_order, with_same: :course_id

  def next_section
    course.sections.where('row_order > ?', row_order).rank(:row_order).first
  end
end
