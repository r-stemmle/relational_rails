require 'rails_helper'
# User Story 14, Child Update (x2)
RSpec.describe "As a visitor when I visit child show page" do
  describe "Then I see a link to 'Update Vessel' and I can click it" do
    it "I am taken to vessels edit page where I can see a form with attributes" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit "/vessels/#{zinzi.id}"
      expect(page).to have_content('Zinzi')

      click_on "Update Vessel"

      expect(current_path).to eq("/vessels/#{zinzi.id}/edit")

      fill_in 'Name', with: 'Calypso'
      click_on "Submit"

      expect(current_path).to eq("/vessels/#{zinzi.id}")
      expect(page).to have_content('Calypso')
    end
  end
end
