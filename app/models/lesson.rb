class Lesson < ActiveRecord::Base
  belongs_to :section
  delegate :course, to: :section
  delegate :user, to: :course
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, with_same: :section_id

  def next_lesson
    lesson = section.lessons.where('row_order > ?', row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    lesson
  end
end
