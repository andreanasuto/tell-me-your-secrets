# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

secrets = Secret.create([
  { sentence: 'I love Adam Curtis!', latitude: 40.703112, longitude: -73.985296},
  {sentence: 'I genuinely think Luis Nazario de Lima Ronaldo is an artist', latitude: 40.711636, longitude: -73.993349}
  ])
