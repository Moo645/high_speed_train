class CreateVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :versions do |t|
      t.integer :version_no, null: false, unique: true
      t.string :update_time
      t.string :effective_date
      t.string :expiring_date

      t.timestamps
    end
  end
end
