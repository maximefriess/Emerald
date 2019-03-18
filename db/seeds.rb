require 'csv'

puts 'Cleaning database...'
Message.destroy_all
Listing.destroy_all
Booking.destroy_all

puts 'Creating 10 fake listings with pictures...'

  listing = Listing.new(
    name:    "Abachi",
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
    name:    "Le Rouge Chalet Morzine",
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

filepath = 'db/raw_bookings_data.csv'
csv_options = { headers: :first_row }
CSV.foreach(filepath, csv_options) do |row|
   # ONLY ADD LISTING ID IF REVENUE FIELD IS NOT EMPTY AND IF AN ASSOCIATED LISTING IS FOUND
  csv_listing = row['Properties']
  if row['Accomodation Rev'] && Listing.find_by(name: csv_listing)
    booking = Booking.new(
      year: row[row.headers.first],
      month: row['Mois'],
      revenue: row['Accomodation Rev'].gsub(/[ €]/, '').to_f,
      occupancy_ratio: row['Occpancy Ratio'].to_f,
      average_night_rate: row['Average Night rate 2'].to_f
      )
    booking.listing_id = Listing.find_by(name: csv_listing).id
    booking.save!
  end
end


puts 'Finished!'





