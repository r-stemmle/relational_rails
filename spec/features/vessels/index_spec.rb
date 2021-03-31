require 'rails_helper'
# User Story 3, Child Index (x2)
RSpec.describe "As a visitor" do
  describe "When I visit vessels path" do
    it 'has each vessel in the system with attributes' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit "/vessels"

      expect(page).to have_content('Zinzi')
      expect(page).to have_content('Sabre')
      expect(page).to have_content(36)
      expect(page).to have_content('Mast up')
    end
  end

  # User Story 15, Child Index only shows `true` Records (x2)
  describe "When I visit all vessels" do
    it "I only see the records where the mast is up" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      visit '/vessels'

      expect(page).to have_content('Zinzi')
      expect(page).to have_no_content('Shorty')
      # binding.pry
    end
  end
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`
end
