class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :court, null: false, foreign_key: true

      t.timestamps
    end
  end
end
