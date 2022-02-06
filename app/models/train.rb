class Train < ApplicationRecord
  belongs_to :version, class_name: "Version", :foreign_key => "version_id"

  has_many :stop_times, class_name: "StopTime"
  has_many :stations, through: :stop_times
  accepts_nested_attributes_for :stop_times
  
  def self.find_trains(params)
    scope :checking, -> { where(params[:direction]).where(params[:date]) }
    @trains_time = []
    ######### find stations active_record & station_info
    @origin_station = Station.find_by(params[:d_station])
    @destination_station = Station.find_by(params[:a_station])
    
    ######### find available trains_no
    dep_trains = @origin_station.trains.checking.to_sql 
    arr_trains = @destination_station.trains.checking.to_sql 
    @available_trains =  Train.find_by_sql %Q( #{dep_trains} INTERSECT #{arr_trains} )
    
    ######### find stop_times of available trains_no
    @available_trains.each do |t|
      times = t.stop_times
      trains_time = {
        train_no: t.train_no, 
        origin_time: times.select {|t| t.station_id == @origin_station.id }[0],
        destination_time: times.select {|t| t.station_id == @destination_station.id }[0]
      }
      @trains_time << trains_time
    end

    data = {
      available_trains: @trains_time, 
      origin_station: @origin_station, 
      destination_station: @destination_station
    }

  end


end
