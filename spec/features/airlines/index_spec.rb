require 'rails_helper'

RSpec.describe 'airline story 1: parent index', type: :feature do
  it 'can list the names of each airline record in the system' do
    airline_1 = Airline.create(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    airline_2 = Airline.create(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    visit "/airlines"

    expect(page).to have_content(airline_1.name)
    expect(page).to have_content(airline_2.name)
  end
end
