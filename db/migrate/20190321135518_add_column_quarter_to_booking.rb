class AddColumnQuarterToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :quarter, :string
  end
end
