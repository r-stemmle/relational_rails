require 'rails_helper'

RSpec.describe 'airline story 1: parent index', type: :feature do
  it 'can list the names of each airline record in the system' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    fedex = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    visit "/airlines"

    expect(page).to have_content(alaska_airlines.name)
    expect(page).to have_content(fedex.name)
  end
end

RSpec.describe 'airline story 2: parent show', type: :feature do
  it 'can list the attributes of the specified airline id' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    fedex = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    
    visit "/airlines/#{alaska_airlines.id}"
    expect(page).to have_content(alaska_airlines.name)
    expect(page).to have_content(alaska_airlines.fleet_size)
    expect(page).to have_content(alaska_airlines.is_mainline_passenger)
    expect(page).to have_content(alaska_airlines.created_at)
    expect(page).to have_content(alaska_airlines.updated_at)

    visit "/airlines/#{fedex.id}"
    expect(page).to have_content(fedex.name)
    expect(page).to have_content(fedex.fleet_size)
    expect(page).to have_content(fedex.is_mainline_passenger)
    expect(page).to have_content(fedex.created_at)
    expect(page).to have_content(fedex.updated_at)
    
  end
end

