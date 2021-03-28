require 'rails_helper'
require './app/models/airline.rb'

RSpec.describe 'airline story 5: child attributes shown at parent id', type: :feature do
  it 'can show the pilots and their attributes that are associated with individual airlines' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                      fleet_size: 83,
                                      is_mainline_passenger: true)
    fedex = Airline.create!(name: 'Fedex',
                            fleet_size: 124,
                            is_mainline_passenger: false)
    l_lewis = alaska_airlines.pilots.create!(
      name: "Lionel Lewis",
      is_captain: true,
      years_experience: 26
    )
    b_horton = alaska_airlines.pilots.create!(
      name: "Brian Horton",
      is_captain: true,
      years_experience: 18
    )
    k_scott = alaska_airlines.pilots.create!(
      name: "Kim Scott",
      is_captain: false,
      years_experience: 20
    )
    e_nortey = fedex.pilots.create!(
    name: "Ernest Nortey",
    is_captain: false,
    years_experience: 21
    )
    m_jones = fedex.pilots.create!(
        name:"Matt Jones",
        is_captain: false,
        years_experience: 10
    )

  visit "/airlines/#{alaska_airlines.id}/pilots"
  
  visit "/airlines/#{fedex.id}/pilots"
  require 'pry'; binding.pry
  expect(page).to have_content(fedex.pilots.name)
  expect(page).to have_content(fedex.pilots.fleet_size)
  expect(page).to have_content(fedex.pilots.is_mainline_passenger)
  expect(page).to have_content(fedex.pilots.created_at)
  expect(page).to have_content(fedex.pilots.updated_at)

  end
end
