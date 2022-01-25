class CreateStopTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :stop_times do |t|
      t.integer :stop_sequence
      t.string :departure_time 
      t.string :arrival_time 
      t.references :train, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
