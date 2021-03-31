require 'rails_helper'
# User Story 19, Parent Delete (x2)
RSpec.describe 'Parent Delete' do
  describe 'As a visitor to marinas show page' do
    it 'has a link I can click and delete the marina' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit '/marinas'
      click_on 'Delete Marina'

      expect(current_path).to eq('/marinas')
      expect(page).to have_no_content("#{smbs.name}")
    end
  end
end
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
