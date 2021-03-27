# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vessel.destroy_all
Marina.destroy_all
Pilot.destroy_all
Airline.destroy_all

alaska_airlines = Airline.create!(
    name: 'Alaska Airlines',
    fleet_size: 85,
    is_mainline_passenger: true
    )
fedex = Airline.create!(
    name: 'Fedex',
    fleet_size: 123,
    is_mainline_passenger: false
    )

smbs = Marina.create!(
    name: 'St. Marys Boat Services',
    city: 'St. Marys',
    state: 'GA',
    has_boat_ramp: false,
    low_tide_depth: 3,
    high_tide_depth: 9,
    created_at: "2021-03-21 17:35:00"
    )

tmh = Marina.create!(
    name: 'Three Mile Harbor',
    city: 'Springs',
    state: 'NY',
    has_boat_ramp: true,
    low_tide_depth: 6,
    high_tide_depth: 10
    )

smbs.vessels.create!(
    name: 'Zinzi',
    make: 'Sabre',
    length_overall: 36,
    mast_up: true
)

smbs.vessels.create!(
    name: 'Grace',
    make: 'Brewer',
    length_overall: 44,
    mast_up: true
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
