class AvailableTrainInfo

  def initialize(avaliable_trains, stations)
    @trains = avaliable_trains
    @origin_station = stations[:origin_station]
    @destination_station = stations[:destination_station]
  end

  def perform
    @trains_time = []
    @trains.each do |t|
      times = t.stop_times
      trains_time = {
        train_no: t.train_no, 
        origin_time: times.select {|t| t.station_id == @origin_station.id }.first,
        destination_time: times.select {|t| t.station_id == @destination_station.id }.first
      }
      @trains_time << trains_time
    end

    trains_info = {
      available_trains: @trains_time, 
      origin_station: @origin_station, 
      destination_station: @destination_station
    }
  end

end