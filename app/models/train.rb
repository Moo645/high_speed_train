class Train < ApplicationRecord
  belongs_to :version, class_name: "Version", :foreign_key => "version_id"

  has_many :stop_times, class_name: "StopTime"
  has_many :stations, through: :stop_times
  accepts_nested_attributes_for :stop_times
  
  def self.find_trains(params)
    scope :checking, -> { where(direction: params[:direction]).where(params[:day_week]) }
    stations = {
      origin_station: Station.find_by(station_uid: params[:start_station]),
      destination_station: Station.find_by(station_uid: params[:end_station])
    }
    trains = {
      ori: stations[:origin_station].trains.checking.to_sql,
      des: stations[:destination_station].trains.checking.to_sql
    }
    available_trains =  Train.find_by_sql %Q( #{trains[:ori]} INTERSECT #{trains[:des]} )
    trains_info = AvailableTrainInfo.new(available_trains, stations).perform
  end

end
