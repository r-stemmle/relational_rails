require 'rails_helper'
#US 11
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
