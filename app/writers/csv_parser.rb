require 'csv'
class CsvParser
  def initialize(filepath)
    @raw_parsed = []
    csv_options = { headers: :first_row }
    CSV.foreach(filepath, csv_options) do |row|
      if row['Accomodation Rev']
        revenue = row['Accomodation Rev'].gsub(/[ €]/, '').to_f
      else
        revenue = row['Accomodation Rev']
      end
      if row['Average Night rate 2']
        avg = row['Average Night rate 2'].gsub(/[ €]/, '').to_f
      else
        avg = row['Average Night rate 2']
      end
      @raw_parsed << {
        name: row['Properties'],
        year: row[row.headers.first],
        month: row['Mois'],
        revenue: revenue,
        occupancy_ratio: row['Occpancy Ratio'].to_f,
        average_night_rate: avg
      }
    end
  end

  def create_bookings
    @raw_parsed.each do |booking|
      if Listing.find_by(name: booking[:name])
        booking = Booking.new(
          listing_id: Listing.find_by(name: booking[:name]).id,
          year: booking[:year],
          month: booking[:month],
          revenue: booking[:revenue],
          occupancy_ratio: booking[:occupancy_ratio],
          average_night_rate: booking[:average_night_rate]
        )
        booking.save!
      end
    end
  end

  def all_listings
    csv_listing_names = []
    @raw_parsed.each do |booking|
      csv_listing_names << booking[:name]
    end
    csv_listing_names = csv_listing_names.uniq
    csv_listing_names
  end
end
