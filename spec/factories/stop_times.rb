FactoryBot.define do
  factory :stop_time do
    departure_time { "MyString" }
    arrival_time { "MyString" }
    train_id { nil }
    station_id { nil }
  end
end
