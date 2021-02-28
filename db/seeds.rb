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
  puts "#{dog.dog_name} who is a #{dog.size} #{dog.breed} has been created!"
end
puts "--------------"
puts "#{User.count} users were created."
puts "--------------"
users = User.all
#####################

### CREATE VENUES ###
# first scrape the addresses
puts "scraping for venue addresses"
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
puts "------------------------------"
puts "creating those ven-ven-venues!"
# create and save the venues
categories = ['cafe', 'restaurant', 'bar']
venue_addresses.each do |address|
  venue = Venue.new(
    name: Faker::Restaurant.unique.name,
    address: address,
    category: categories.sample,
    description: Faker::Restaurant.description
  )
  venue.user = users.sample
  i = 1
  5.times do
    venue_pic_url = URI.open("https://source.unsplash.com/500x400/?#{venue.category}")
    venue.photos.attach(io: venue_pic_url, filename: "#{venue.name}#{i}.png", content_type: 'image/png')
    i += 1
  end
  venue.save!
end
puts "------------------------------"
puts "There are #{Venue.count} venues"
######################

### CREATE REVIEWS AND TAGS###
puts "creating 3 reviews and 2 tags for each venue"
venues = Venue.all
venues.each do |venue|
  tags = ['$', '$$', '$$$', 'waterbowls', 'dogtreats', 'friendly', 'warm', 'humanlikesfood', 'crowded', 'cozy']
  tags.map! { |tag| Tag.create(name: tag) }
  2.times do
    venuetag = Venuetag.new
    venuetag.venue = venue
    venuetag.tag = tags.sample
    if venue.tags.include?(venuetag.tag)
      i = tags.index(venuetag.tag)
      venuetag.tag = i < tags.length ? tags[i + 1] : tags.first
    end
    venuetag.save!
  end

  i = 1
  3.times do
    review = Review.new(
      rating: (3..5).to_a.sample,
      comment: Faker::Restaurant.review
    )
    review.venue = venue
    review.user = users.sample
    review_pic_url = URI.open("https://source.unsplash.com/500x400/?#{review.user.breed}")
    review.photo.attach(io: review_pic_url, filename: "#{venue.name}_review#{i}.png", content_type: 'image/png')
    review.save!
    i += 1
  end
end
reviews = Review.all
puts "#{reviews.count} reviews were created and 2 tags per venue"
################################
