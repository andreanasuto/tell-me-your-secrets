# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location_1 = Location.create(latitude: 40.6871, longitude: -73.9621) # Bar Laika - Clinton Hill, NYC
location_2 = Location.create(latitude: 40.6769, longitude: -73.9900) # Gowanus Canal - Streetart Work, NYC
location_3 = Location.create(latitude: 31.6270, longitude: -7.9859) # Marrakech - Barber Shop, Morocco

user_1 = User.create({name: "herny_kissinger", email: "kissinger@secretplan.gov", password: SecureRandom.hex(10)})
user_2 = User.create({name: "pelin_is_a_cat", email: "pelin@catemail.ai", password: SecureRandom.hex(10)})

secrets = Secret.create([
  {sentence: 'I love Adam Curtis!', location_id: location_1.id, user_id: user_1.id },
  {sentence: 'I genuinely think Luis Nazario de Lima Ronaldo is an artist', location_id: location_2.id, user_id: user_2.id},
  {sentence: 'I had my hair cut here!', location_id: location_3.id, user_id: user_1.id}
  ])
