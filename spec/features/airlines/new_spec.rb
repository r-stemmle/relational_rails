require 'rails_helper'

RSpec.describe 'New Pilot' do
  describe 'user story 11: create new ppilot' do
    it 'can create a new pilot from form' do
      visit '/airlines'

      click_link 'New Airline'

      expect(current_path).to eq('/airlines/new')

      fill_in 'Name', with: 'Prime Air'
      # fill_in :fleet_size, with: 40
      # fill_in :is_mainline_passenger, with: false
      click_on 'Create Airline'

      expect(current_path).to eq('/airlines')
      expect(page).to have_content('Prime Air')
      # expect(page).to have_content(40)
      # expect(page).to have_content(false)
    end
  end
end


# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.