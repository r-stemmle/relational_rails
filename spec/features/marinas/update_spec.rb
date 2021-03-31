require 'rails_helper'
# User Story 12, Parent Update (x2)
RSpec.describe "Marina Update" do
  describe 'As a visitor when I visit a marinas show page' do
    it 'has a link to update the marina' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")

      visit "/marinas/#{smbs.id}"

      expect(page).to have_content('St. Marys, GA')

      click_on 'Update Marina'
      expect(current_path).to eq("/marinas/#{smbs.id}/edit")

      fill_in 'State', with: 'FL'
      click_on 'Submit'

      expect(current_path).to eq("/marinas/#{smbs.id}")

      expect(page).to have_content('St. Marys, FL')
    end
  end
end
