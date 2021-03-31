require 'rails_helper'

RSpec.describe Vessel do
  describe 'relationships' do
    it {should belong_to :marina}
  end
end

RSpec.describe "Class Methods" do
  describe 'Vessel' do
    it 'only displays vessels with mast up' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      shorty = smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )
      #AR::Assoc object vs vessel row??
      expect(smbs.vessels.mast_up.first).to eq(zinzi)
    end
  end


  describe 'displays vessels' do
    it 'sorted alphabetically' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      shorty = smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      expect(smbs.vessels.sorted).to eq([shorty, zinzi])
    end
  end

end
