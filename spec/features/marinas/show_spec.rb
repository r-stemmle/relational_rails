require 'rails_helper'

# User Story 2, Parent Show (x2)
RSpec.describe "Parent Show" do
  describe "As a visitor when I visit a marina page" do
    it 'shows the marina and its attributes' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit "/marinas/#{smbs.id}"

      expect(page).to have_content(smbs.name)
      expect(page).to have_content(smbs.city)
      expect(page).to have_content(smbs.state)
      expect(page).to have_content(smbs.has_boat_ramp)
      expect(page).to have_content(smbs.low_tide_depth)
      expect(page).to have_content(smbs.high_tide_depth)
    end
  end


  # User Story 7, Parent Child Count (x2)
    describe "When I visit the marina show page" do
      it "can display the count of vessels at marina" do
        smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
        smbs.vessels.create!(name: 'Zinzi', make: 'Sabre', length_overall: 36, mast_up: true )

        visit "/marinas/#{smbs.id}"

        expect(page).to have_content(smbs.name)
        expect(page).to have_content(smbs.vessels.count)
      end
    end

  # User Story 10, Parent Child Index Link
    describe "When I visit a marina show page" do
      it "has a link to take me to that marinas vessels page" do
        smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

        visit "/marinas/#{smbs.id}"

        expect(page).to have_link("St. Marys Boat Services")
      end
    end
end
