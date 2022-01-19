class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.string :station_uid,  null: false 
      t.string :station_code, null: false 
      t.jsonb :station_name,  null: false
      t.integer :version,     null: false

      t.timestamps
    end
  end
end
