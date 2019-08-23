# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
other_astronaut = Astronaut.create(name: "Not Neil Armstrong", age: 45, job: "Commander 2")
apollo_13 = neil.missions.create(title: "Apollo 13", time_in_space: 120)
cap_4 = neil.missions.create(title: "Capricorn 4", time_in_space: 220)
apollo_15 = other_astronaut.missions.create(title: "Apollo 15", time_in_space: 560)
cap_12 = other_astronaut.missions.create(title: "Capricorn 12", time_in_space: 123)
