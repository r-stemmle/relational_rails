require 'rails_helper'

RSpec.describe 'pilot Update From pilot Index Page' do
  describe 'pilot story 18' do
    it 'can update pilot from index page' do
      alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                    fleet_size: 83,
                                    is_mainline_passenger: true
                                    )
       k_scott = alaska_airlines.pilots.create!(
        name: "Kim Scott",
        is_captain: false,
        years_experience: 20
      )
      visit "/airlines/#{alaska_airlines.id}/pilots"

      click_link 'Update Pilot'

      expect(current_path).to eq("/airlines/#{alaska_airlines.id}/pilots/#{k_scott.id}/edit")
   
    end
  end
end