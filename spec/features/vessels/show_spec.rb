require 'rails_helper'
#user story 4
RSpec.describe "Vessels show" do
  describe 'As a visitor when I visit a vessel page' do
    it 'shows the vessel and the vessels attributes' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit "/vessels/#{zinzi.id}"

      expect(page).to have_content('Zinzi')
      expect(page).to have_content('Sabre')
      expect(page).to have_content(36)
      expect(page).to have_content('Mast up')
    end
  end
end
