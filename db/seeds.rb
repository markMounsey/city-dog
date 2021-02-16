# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'nokogiri'

puts "Cleaning database, start fresh"
User.destroy_all

puts "creating users"
20.times do
  full_name = Faker::Name.name.split(' ')
  dog = User.new(
    dog_name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    size: ['small', 'med-small', 'medium', 'med-large', 'large'].sample,
    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
                  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                  sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                  Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
                  Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
                  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
    owner_name: full_name.first,
    email: Faker::Internet.email,
    password: "password"
  )
  pic_url = URI.open("https://source.unsplash.com/500x400/?#{dog.breed}")
  dog.photo.attach(io: pic_url, filename: "#{dog.dog_name}_#{dog.breed}.png", content_type: 'image/png')
  dog.save!
end
puts "#{User.count} users created!"

venue_addresses = []


venue_url = "https://www.gelbeseiten.de/Suche/Restaurants/K%C3%B6ln?umkreis=5232"
html_file = open(venue_url).read
html_doc = Nokogiri::HTML(html_file)

# cards = html_doc.search('.mod .mod-Treffer')

