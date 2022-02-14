json.train_no @train.train_no
json.stop_time do
  json.array! @train.stop_times do |t|
    s = t.station
    json.stop_sequence t.stop_sequence
    json.station_uid s.station_uid
    json.station_uid s.station_name
    json.arrival_time t.arrival_time
    json.departure_time t.departure_time
  end

end