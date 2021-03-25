# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Marina.destroy_all
Vessel.destroy_all
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
    high_tide_depth: 9
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
