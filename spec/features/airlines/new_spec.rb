require 'rails_helper'

RSpec.describe 'New Airline' do
  describe 'user story 11: create new airline' do
    it 'can create a new airline from form' do
      visit '/airlines'

      click_link 'New Airline'

      expect(current_path).to eq('/airlines/new')

      fill_in 'Name', with: 'Prime Air'
      click_on 'Create Airline'
      expect(current_path).to eq('/airlines')
      expect(page).to have_content('Prime Air')
    
    end
  end
end
