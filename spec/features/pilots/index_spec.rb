require 'rails_helper'

RSpec.describe 'show pilot attributes', type: :feature do
  it 'can see each pilot and it\'s attributes' do
    alaska_airlines = Airline.create!(
      name: 'Alaska Airlines',
      fleet_size: 85,
      is_mainline_passenger: true
      )
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


  visit '/pilots'
  expect(page).to have_content(l_lewis.name)
  expect(page).to have_content(l_lewis.is_captain)
  expect(page).to have_content(l_lewis.years_experience)
  expect(page).to have_content(b_horton.name)
  expect(page).to have_content(b_horton.is_captain)
  expect(page).to have_content(b_horton.years_experience)
  expect(page).to have_content(k_scott.name)
  expect(page).to have_content(k_scott.is_captain)
  expect(page).to have_content(k_scott.years_experience)
  end
end

RSpec.describe 'show individual pilot attributes', type: :feature do
  it 'can display all of the attributes of a specified pilot' do
     alaska_airlines = Airline.create!(
      name: 'Alaska Airlines',
      fleet_size: 85,
      is_mainline_passenger: true
      )
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
    visit "/pilots/#{l_lewis.id}"
    expect(page).to have_content(l_lewis.name)
    expect(page).to have_content(l_lewis.is_captain)
    expect(page).to have_content(l_lewis.years_experience)
    
    visit "/pilots/#{b_horton.id}"
    expect(page).to have_content(b_horton.name)
    expect(page).to have_content(b_horton.is_captain)
    expect(page).to have_content(b_horton.years_experience)
    
    visit "/pilots/#{k_scott.id}"
    expect(page).to have_content(k_scott.name)
    expect(page).to have_content(k_scott.is_captain)
    expect(page).to have_content(k_scott.years_experience)
  end
end