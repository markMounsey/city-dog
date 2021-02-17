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

### CREATE USERS ###
puts "creating users"
puts "--------------"
20.times do
  full_name = Faker::Name.name.split(' ')
  dog = User.new(
    dog_name: Faker::Creature::Dog.unique.name,
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
  dog_pic_url = URI.open("https://source.unsplash.com/500x400/?#{dog.breed}")
  dog.photo.attach(io: dog_pic_url, filename: "#{dog.dog_name}_#{dog.breed}.png", content_type: 'image/png')
  dog.save!
  puts "#{dog.dog_name} has been created!"
end
puts "--------------"
puts "#{User.count} users were created."
puts "--------------"
users = User.all
#####################

### CREATE VENUES ###
# first scrape the addresses
puts "scraping for venue addresses"
venue_addresses = []
venue_url = "https://www.gelbeseiten.de/Suche/Restaurants/K%C3%B6ln?umkreis=5232"
html_file = open(venue_url).read
html_doc = Nokogiri::HTML(html_file)

addresses_html = html_doc.search('.mod-AdresseKompakt > p')
venue_addresses = []
addresses_html.each do |address|
  clean_address = address.text.split(' ').each(&:strip!).join(' ').gsub(/Köln.*/, 'Köln')
  venue_addresses << clean_address
end
venue_addresses.select! { |venue| venue_addresses.index(venue).even? }.uniq!
puts "addresses aquired:"
puts venue_addresses
puts "------------------------------"

puts "creating those ven-ven-venues!"
puts "------------------------------"
# create and save the venues
categories = ['cafe', 'restaurant', 'bar']
venue_addresses.each do |address|
  venue = Venue.new(
    name: Faker::Restaurant.name,
    address: address,
    category: categories.sample,
    description: Faker::Restaurant.description
  )
  venue.user = users.sample
  venue_pic_url = URI.open("https://source.unsplash.com/500x400/?#{venue.category}")
  i = 1
  5.times do
    venue.photos.attach(io: venue_pic_url, filename: "#{venue.name}#{i}.png", content_type: 'image/png')
    i += 1
  end
  venue.save!
  puts "The #{venue.category} named #{venue.name} at #{venue.address} has been added by the user: #{venue.user}"
end
####################

