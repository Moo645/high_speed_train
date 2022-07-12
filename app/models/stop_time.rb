class StopTime < ApplicationRecord
  belongs_to :train, foreign_key: 'train_id'
  belongs_to :station, foreign_key: 'station_id'

  accepts_nested_attributes_for :train, :station
end
