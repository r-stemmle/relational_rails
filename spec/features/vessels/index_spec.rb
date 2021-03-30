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


# User Story 8, Child Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  describe "When I visit any page on the site" do
    it "has a link to the child index" do

    end
  end
end
