require 'rails_helper'
# User Story 23, Child Delete
RSpec.describe "Child Delete" do
  describe 'As a visitor to the vessel index page' do
    it "has a link to delete vessel that I click" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit '/vessels'
      click_on 'Delete Vessel'

      expect(current_path).to eq('/vessels')
      expect(page).to have_no_content("#{zinzi.name}")
    end
  end

  #User story 20
  describe "As a visitor to the vessel show page" do
    it "has a link to delete the vessle" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit "/vessels/#{zinzi.id}"
      click_on 'Delete Vessel'

      expect(current_path).to eq('/vessels')
      expect(page).to have_no_content("#{zinzi.name}")
    end
  end
end
