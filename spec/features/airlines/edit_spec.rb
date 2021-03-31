require 'rails_helper'

RSpec.describe 'Update Airline' do
  describe 'user story 12: update existing Airline' do
    it 'can update existing airline from form' do
     alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                      fleet_size: 83,
                                      is_mainline_passenger: true)
      visit "/airlines/#{alaska_airlines.id}"

      click_link 'Update Airline'
      save_and_open_page
      expect(current_path).to eq("/airlines/#{alaska_airlines.id}/edit")
      fill_in 'Name', with: 'Theresa Cargo Carrier'
      click_on 'Update Airline'
      expect(current_path).to eq("/airlines/#{alaska_airlines.id}")
      expect(page).to have_content('Theresa Cargo Carrier')
    
    end
  end
end
