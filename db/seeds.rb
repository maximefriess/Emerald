puts 'Cleaning database...'
Listing.destroy_all

puts 'Creating 10 fake listings with pictures...'
10.times do
  listing = Listing.new(
    name:    Faker::GreekPhilosophers.name,
    location: Faker::Address.city,
  )
  listing.save!
  3.times do
    photo = Photo.new(listing_id: listing.id)
    url = Faker::Placeholdit.image
    photo.remote_content_url = url
    photo.save
  end
end

puts 'Finished!'
