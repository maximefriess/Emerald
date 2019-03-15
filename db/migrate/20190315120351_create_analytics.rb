class CreateAnalytics < ActiveRecord::Migration[5.2]
  def change
    create_table :analytics do |t|
      t.date :month
      t.float :revenue
      t.float :bookings
      t.float :occupancy_ratio
      t.float :average_night_rate
      t.references :listing, foreign_key: true
      t.timestamps
    end
  end
end
