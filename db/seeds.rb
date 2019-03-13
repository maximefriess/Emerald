# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
listing = Listing.new(name: "beautiful swiss chalet")
listing.save
url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
photo = Photo.new(listing_id: listing.id)
photo.remote_content_url = url
photo.save
