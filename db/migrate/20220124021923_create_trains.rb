class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.string :train_no, null: false, unique: true
      t.integer :service_day, array: true, null: false
      t.integer :direction, null: false
      t.references :version, null: false, foreign_key: true

      t.timestamps
    end
  end
end
