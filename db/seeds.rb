# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
