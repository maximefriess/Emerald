class ChangeDateTypeInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :month, :string
  end
end
