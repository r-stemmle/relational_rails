require 'rails_helper'
# User Story 13, Parent Child Creation (x2)
RSpec.describe 'New Vessel' do
  describe 'As a visitor' do
    describe 'When I visit the marinas vessels page I see a link to add a new vessel' do
      it 'I can create a new vessel' do
        smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

        visit "/marinas/#{smbs.id}/vessels"

        click_link 'New Vessel'

        expect(current_path).to eq('/vessels/new')

        fill_in 'Name', with: 'Ada'
        click_on 'Create Vessel'

        expect(current_path).to eq("/marinas/#{smbs.id}/vessels")
        expect(page).to have_content('Ada')
      end
    end
  end
end
