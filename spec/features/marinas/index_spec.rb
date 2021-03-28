require 'rails_helper'

# User Story 6, Parent Index sorted by Most Recently Created (x2)
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
RSpec.describe "As a visitor" do

  describe "When I visit the marina index" do
    it "orders marinas by recently created first and shows created_at" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      tmh = Marina.create!(name: "Three Mile Harbor", city: "Springs", state: "GA", has_boat_ramp: true, low_tide_depth: 6, high_tide_depth: 10, created_at: "2020-03-27 17:37:52")

      visit '/marinas'

      expect(page).to have_content(smbs.name)
      expect(page).to have_content(smbs.created_at)
      expect(page).to have_content(tmh.name)
      expect(page).to have_content(tmh.created_at)
    end
  end

# User Story 7, Parent Child Count (x2)
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
  describe "When I vit the marina show page" do
    it "displays the count of vessels at marina" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(name: 'Zinzi', make: 'Sabre', length_overall: 36, mast_up: true )

      visit "/marinas/#{smbs.id}"

      expect(page).to have_content(smbs.name)
      expect(page).to have_content(smbs.vessels.count)
    end
  end

#User Story 9, Parent Index Link
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
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
