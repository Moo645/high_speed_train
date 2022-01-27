class AddDayWeekToTrains < ActiveRecord::Migration[6.1]
  def change

    
    add_column :trains, :monday, :integer
    add_column :trains, :tuesday, :integer
    add_column :trains, :wednesday, :integer
    add_column :trains, :thursday, :integer
    add_column :trains, :friday, :integer
    add_column :trains, :saturday, :integer
    add_column :trains, :sunday, :integer
    
    remove_column :trains, :service_day
  end
end
