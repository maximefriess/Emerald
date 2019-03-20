require 'csv'

puts 'Cleaning database...'
User.destroy_all
Message.destroy_all
Listing.destroy_all
Booking.destroy_all

puts 'Creating 2 fake listings with 3 pictures...'

  listing = Listing.new(
    display_name:    "Abachi",
    location: Faker::Address.city
  )
  listing.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/516f7027542937cdabd457cab8a21dc4.jpg"
    photo.remote_content_url = url
    photo.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/8aac98943a58b5311eb3d2e719235b1b.jpg"
    photo.remote_content_url = url
    photo.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/a5156034e6b4a19f8f5feaae5802f617.jpg"
    photo.remote_content_url = url
    photo.save!

  4.times do
    message = Message.new(
      listing_id: listing.id,
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      doc_type: ['contract', 'invoice', 'other'].sample,
      attachment: 'pdf-file.png'
      )
    message.save!
  end

  listing = Listing.new(
    display_name:    "Le Rouge Chalet Morzine",
    location: Faker::Address.city
  )
  listing.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/cb0c94f0217a3ca1857f40e2d7d9edd6.jpg"
    photo.remote_content_url = url
    photo.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/a570e6e0b9f90e8ef5d018d4d03b53b8.jpg"
    photo.remote_content_url = url
    photo.save!

    photo = Photo.new(listing_id: listing.id)
    url = "https://emerald.projtest.info/images/uploads/ed11346a9cea7ba0bbd54ed4722fa8bf.jpg"
    photo.remote_content_url = url
    photo.save!

  4.times do
    message = Message.new(
      listing_id: listing.id,
      title: Faker::Book.title,
      content: Faker::Lorem.paragraphs(4),
      doc_type: ['contract', 'invoice', 'other'].sample,
      attachment: ['pdf-file.png', Faker::LoremPixel.image("500x500")].sample
      )
    message.save!
  end

puts 'Creating booking instances with parsed data'
CsvParser.new('db/raw_bookings_data.csv').create_bookings

puts 'Finished!'





