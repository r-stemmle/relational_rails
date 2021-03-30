require 'rails_helper'


RSpec.describe "As a visitor" do
  # User Story 1, Parent Index (x2)
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "When I visit marinas path" do
    it 'shows the name of each marina' do
      tmh = Marina.create!(name: "Three Mile Harbor", city: "Springs", state: "GA", has_boat_ramp: true, low_tide_depth: 6, high_tide_depth: 10, created_at: "2020-03-27 17:37:52")
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit '/marinas'

      expect(page).to have_content(smbs.name)
      expect(page).to have_content(smbs.created_at)
      expect(page).to have_content(tmh.name)
      expect(page).to have_content(tmh.created_at)
    end
  end



#   User Story 5, Parent Children Index (x2)
  describe "When I visit the marina index" do
    it "orders marinas by recently created first and shows created_at" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      tmh = Marina.create!(name: "Three Mile Harbor", city: "Springs", state: "GA", has_boat_ramp: true, low_tide_depth: 6, high_tide_depth: 10, created_at: "2020-03-27 17:37:52")

      visit '/marinas'

      # expect(page.body).to match(/smbs.*tmh/m)
    end
  end



#User Story 9, Parent Index Link

  describe "When I visit any page on the site" do
    it "has a link to the parent index" do

    end
  end

# User Story 10, Parent Child Index Link
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  describe "When I visit a marina page" do
    it "has a link to take me to that marinas vessels page" do
    end
  end


end
