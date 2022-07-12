class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :reservation_code, null: false
      t.integer :train_id, null: false
      t.string :date, null: false
      t.integer :ori_stop_time_id, null: false
      t.integer :des_stop_time_id, null: false

      t.timestamps
    end
    add_index :reservations, :reservation_code, unique: true
    add_foreign_key :reservations, :trains

  end
end
