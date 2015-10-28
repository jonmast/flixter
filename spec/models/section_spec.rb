require 'rails_helper'

RSpec.describe Section, :type => :model do
  describe 'ranked-model' do
    it 'allows reordering sections' do
      FactoryGirl.create_list(:section, 2, course: FactoryGirl.create(:course))
      old_first = Section.rank(:row_order).first
      old_first.update_attributes(row_order_position: :last)
      expect(Section.rank(:row_order).last).to eq old_first
    end
  end
end
