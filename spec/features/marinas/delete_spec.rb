require 'rails_helper'
# User Story 22, Parent Delete (x2)
RSpec.describe 'Parent Delete' do
  describe 'As a visitor to marinas index page' do
    it 'has a link I can click and delete the marina' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit '/marinas'
      click_on 'Delete Marina'

      expect(current_path).to eq('/marinas')
      expect(page).to have_no_content("#{smbs.name}")
    end
  end
end

# User Story 19
  describe 'When I visit the marinas show page' do
    it "I see a link to delete the marina" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit "/marinas/#{smbs.id}"
      click_on 'Delete Marina'

      expect(current_path).to eq("/marinas")
      expect(page).to have_no_content("#{smbs.name}")
    end
  end

# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to delete that parent
# When I click the link
# I am returned to the Parent Index Page where I no longer see that parent
