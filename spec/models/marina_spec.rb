require 'rails_helper'

RSpec.describe Marina do

  describe 'relationships' do
    it { should have_many :vessels }
  end



  describe 'descending_order_by_created' do
    it 'returns all marinas in order from created most recent on top' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      tmh = Marina.create!(name: "Three Mile Harbor", city: "Springs", state: "GA", has_boat_ramp: true, low_tide_depth: 6, high_tide_depth: 10, created_at: "2020-03-27 17:37:52")
      # binding.pry
      expect(Marina.descending_order_by_created).to eq([smbs, tmh])


    end
  end


end
