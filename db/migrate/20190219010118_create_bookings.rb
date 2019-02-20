class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :customer
      t.references :tour
      t.integer :bseats
      t.integer :bwait_list

      t.timestamps
    end
  end
end
