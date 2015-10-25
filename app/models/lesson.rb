class Lesson < ActiveRecord::Base
  belongs_to :section
  delegate :course, to: :section
  mount_uploader :video, VideoUploader
end
