class CsvParser
require 'csv'

  def initialize(filepath)
    @filepath = filepath
  end

  def create_bookings
    csv_options = { headers: :first_row }
    CSV.foreach(@filepath, csv_options) do |row|
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
  end

  def all_listings
    csv_listing_names = []
    csv_options = { headers: :first_row }
    CSV.foreach(@filepath, csv_options) do |row|
      csv_listing_names << row['Properties']
    end
    csv_listing_names = csv_listing_names.uniq
    csv_listing_names
  end

  def all_months

  end

  def all_years


end
