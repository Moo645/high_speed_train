class Api::V1::ReservationsController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :find_reservation, only: [:create, :show]
  before_action :reservation_params, only: [:create]

  def create
    train = Train.find_by(train_no: params[:train_no])
    stop_times = {
      ori_time: train.stop_times.find_by(station_id: params[:ori_station]),
      des_time: train.stop_times.find_by(station_id: params[:des_station]),
    }
    @reservation = train.reservations.create(
      reservation_code: Reservation.gen_reservation_code, 
      train_id: train.id,
      date: params[:date], 
      ori_stop_time_id: stop_times[:ori_time].id,
      des_stop_time_id: stop_times[:des_time].id
    )
  end
  
  def show
    # @reservation = Reservation.find_by(reservation_code: params[:reservation_code])

  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  def reservation_params
    params.permit(:train_no, :date, :ori_station, :des_station)
  end
  
  def find_reservation
    # @reservation = Reservation.find_by(reservation_code: params[:reservation_code])
    # @stop_times = {
    #   ori_time: StopTime.find_by(id: @reservation.ori_stop_time_id),
    #   des_time: StopTime.find_by(id: @reservation.des_stop_time_id)
    # }
    # @stations = {
    #   ori_station: Station.find_by(id: @stop_times[:ori_time].station_id),
    #   des_station: Station.find_by(id: @stop_times[:des_time].station_id)
    # }

  end
end
