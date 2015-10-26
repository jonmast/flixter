require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe '#free?' do
    it 'is false when cost is not zero' do
      expect(FactoryGirl.build(:course, cost: 5).free?).to eq false
    end

    it 'is true when cost is zero' do
      expect(FactoryGirl.build(:course, cost: 0).free?).to eq true
    end
  end

  describe '#premium?' do
    it 'is true when cost is not zero' do
      expect(FactoryGirl.build(:course, cost: 5).premium?).to eq true
    end

    it 'is false when cost is zero' do
      expect(FactoryGirl.build(:course, cost: 0).premium?).to eq false
    end
  end
end
