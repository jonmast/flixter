class Lesson < ActiveRecord::Base
  belongs_to :section
  delegate :course, to: :section
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, with_same: :section_id
end
