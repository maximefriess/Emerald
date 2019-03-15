puts 'Cleaning database...'
Message.destroy_all
Listing.destroy_all

puts 'Creating 10 fake listings with pictures...'
2.times do
  listing = Listing.new(
    name:    "Villa #{Faker::GreekPhilosophers.name}",
    location: Faker::Address.city
  )
  listing.save!
  6.times do
    photo = Photo.new(listing_id: listing.id)
    url = Faker::LoremPixel.image("500x500")
    photo.remote_content_url = url
    photo.save!
  end
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
  analytics = Analytic.new(
    listing_id: listing.id,
    month: Date.today,
    revenue: rand(45000..55000),
    bookings: rand(10..20),
    occupancy_ratio: rand(0.4..0.9),
    average_night_rate: rand(1500..3500),
    )
  analytics.save!
end

puts 'Finished!'

