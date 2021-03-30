require 'rails_helper'
# As a visitor
# When I visit the marinas Index page
# Then I see a link to create a new marina record, "New Marina"
# When I click this link
# Then I am taken to '/marina/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Marina" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Marina Index page where I see the new Marina displayed.

RSpec.describe 'New Marina' do
  describe 'As a visitor' do
    describe 'When I visit the new marina form by clicking a link on the index' do
      it 'I can create a new marina' do

        visit '/marinas'

        click_link 'Create New Marina'

        expect(current_path).to eq('/marinas/new')

        fill_in 'name', with: 'Shaws'
        fill_in 'city', with: 'San Diego'
        fill_in 'state', with: 'CA'
        fill_in 'low_tide_depth', with: 1
        fill_in 'high_tide_depth', with: 2
        click_on 'Create Marina'

        expect(current_path).to eq("/marinas")
        expect(page).to have_content('Shaws')
      end
    end
  end
end
