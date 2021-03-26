require 'rails_helper'

RSpec.describe 'airline story 1: parent index', type: :feature do
  it 'can list the names of each airline record in the system' do
    airline_1 = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    airline_2 = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    visit "/airlines"

    expect(page).to have_content(airline_1.name)
    expect(page).to have_content(airline_2.name)
  end
end

RSpec.describe 'airline story 2: parent show', type: :feature do
  it 'can list the attributes of the specified airline id' do
    airline_1 = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    airline_2 = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    
    visit "/airlines/#{airline_1.id}"
    save_and_open_page
    expect(page).to have_content(airline_1.name)
    expect(page).to have_content(airline_1.fleet_size)
    expect(page).to have_content(airline_1.is_mainline_passenger)
    expect(page).to have_content(airline_1.created_at)
    expect(page).to have_content(airline_1.updated_at)

    visit "/airlines/#{airline_2.id}"
    save_and_open_page
    expect(page).to have_content(airline_2.name)
    expect(page).to have_content(airline_2.fleet_size)
    expect(page).to have_content(airline_2.is_mainline_passenger)
    expect(page).to have_content(airline_2.created_at)
    expect(page).to have_content(airline_2.updated_at)
    
  end
end
