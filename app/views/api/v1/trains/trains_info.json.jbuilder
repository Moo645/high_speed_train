json.origin_station do 
  json.station_uid @origin_station.station_uid
  json.station_name @origin_station.station_name
end

json.destination_station do 
  json.station_uid @destination_station.station_uid
  json.station_name @destination_station.station_name
end

json.available_trains do
  json.array! @available_trains do |t|
    json.train_no t[:train_no]

    json.origin_times do
      json.arrival_time t[:origin_time][:arrival_time]
      json.departure_time t[:origin_time][:departure_time]
    end

    json.destination_time do
      json.arrival_time t[:destination_time][:arrival_time]
      json.departure_time t[:destination_time][:departure_time]
    end

  end
end