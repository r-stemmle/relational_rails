require 'rails_helper'

RSpec.describe 'Create Pilot' do
  describe 'user story 13: create new pilot' do
    it 'can create a new pilot from form' do
       alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                      fleet_size: 83,
                                      is_mainline_passenger: true)

      visit "/airlines/#{alaska_airlines.id}/pilots"

      click_link "Create Pilot"

      visit "/airlines/#{alaska_airlines.id}/pilots/new"

      fill_in 'Name', with: 'Sandy Golden'
      fill_in 'Is Captain', with: 'True'
      fill_in 'Years Experience', with: '22'

      click_on 'Create Pilot'
      expect(current_path).to eq("/airlines/#{alaska_airlines.id}/pilots")
      expect(page).to have_content('Sandy Golden')
    
    end
  end
end

