require 'rails_helper'

RSpec.describe 'New Pilot' do
  describe 'user story 11: create new ppilot' do
    it 'can create a new pilot from form' do
      visit '/airlines'

      click_link 'New Airline'

      expect(current_path).to eq('/airlines/new')

      fill_in 'Name', with: 'Prime Air'
      click_on 'Create Airline'
      save_and_open_page
      expect(current_path).to eq('/airlines')
      expect(page).to have_content('Prime Air')
    
    end
  end
end
