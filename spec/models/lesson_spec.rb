require 'rails_helper'

RSpec.describe Lesson, :type => :model do
  describe '#next_lesson' do
    it 'returns lesson with next highest position' do
      section = FactoryGirl.create(:section)
      lessons = FactoryGirl.create_list(:lesson, 2, section: section)
      expect(lessons[0].next_lesson).to eq lessons[1]
    end

    it 'goes to next section if at the end' do
      lessons = FactoryGirl.create_list(:lesson, 2)
      lessons[0].section.course = lessons[1].course
      lessons[0].section.update_attributes(row_order_position: :first)
      expect(lessons[0].next_lesson).to eq lessons[1]
    end
  end
end
