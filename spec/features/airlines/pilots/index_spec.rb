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
  save_and_open_page
  expect(page).to have_content(l_lewis.name)
  expect(page).to have_content(l_lewis.is_captain)
  expect(page).to have_content(l_lewis.years_experience)
  expect(page).to have_content(b_horton.name)
  expect(page).to have_content(b_horton.is_captain)
  expect(page).to have_content(b_horton.years_experience)
  expect(page).to have_content(k_scott.name)
  expect(page).to have_content(k_scott.is_captain)
  expect(page).to have_content(k_scott.years_experience)

  visit "/airlines/#{fedex.id}/pilots"
  save_and_open_page
  expect(page).to have_content(m_jones.name)
  expect(page).to have_content(m_jones.is_captain)
  expect(page).to have_content(m_jones.years_experience)
  expect(page).to have_content(e_nortey.name)
  expect(page).to have_content(e_nortey.is_captain)
  expect(page).to have_content(e_nortey.years_experience)
  

  end
end
