class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.integer :id
      t.string :name
      t.text :description
      t.number :price
      t.date :booking_deadline
      t.date :from_date
      t.date :to_date
      t.text :start_location
      t.number :contact_agent
      t.integer :seats
      t.integer :wait_list
      t.string :status

      t.timestamps
    end
  end
end
