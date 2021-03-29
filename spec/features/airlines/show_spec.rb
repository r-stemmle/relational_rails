require 'rails_helper'
require './app/models/airline.rb'

RSpec.describe 'airline story 7: pilot count for individual airline', type: :feature do
  it 'can show the number of pilots associated with an individual airline' do
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

  visit "/airlines/#{alaska_airlines.id}"
  expect(page).to have_content(alaska_airlines.pilots.count)
  visit "/airlines/#{fedex.id}"
  expect(page).to have_content(fedex.pilots.count)

  end
end

RSpec.describe 'user story 10: Parent Child Index Link' do
  describe 'on the individual airline page, there are links to those assigned pilots' do
    it 'displays airline/pilots link' do
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

      visit "/airlines/#{alaska_airlines.id}"
      click_link 'Alaska Airlines'   
      expect(current_path).to eq("/airlines/#{alaska_airlines.id}/pilots")
      
      visit "/airlines/#{fedex.id}"
      click_link 'Fedex'
      expect(current_path).to eq("/airlines/#{fedex.id}/pilots")
    end
  end
end