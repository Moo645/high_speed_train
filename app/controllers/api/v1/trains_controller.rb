class Api::V1::TrainsController < ApiController

  def trains_info
    # finds all trains matching the params
    # ---------|params_formmat|--------------
    params = {
    d_station: { station_uid: '1070' },
    a_station: { station_uid: '1000' },
    direction: { direction: 1 },
    date: { monday: 1 }
    }
    # ---------------------------------------
    @trains = Train.find_trains(params)
    
    @origin_station = @trains[:origin_station]
    @destination_station = @trains[:destination_station]
    @available_trains = @trains[:available_trains]

  end




  def train_info
    # 這個是查看指定班車資訊
    # finds train_no = params[:train_no]
  end

  private

end