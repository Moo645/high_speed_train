class Api::V1::TrainsController < ApiController

  def trains_info
    # test url: http://localhost:3000/api/v1/trains.json?start_station=1070&end_station=1000&date=2022-02-13
    trains_params = TrainsParams.new(params).perform
    trains = Train.find_trains(trains_params)
    
    @origin_station = trains[:origin_station]
    @destination_station = trains[:destination_station]
    @available_trains = trains[:available_trains]
  end

  def train_info
    # 這個是查看指定班車資訊
    # finds train_no = params[:train_no]
  end
end