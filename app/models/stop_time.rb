class StopTime < ApplicationRecord
  belongs_to :train
  belongs_to :station

  accepts_nested_attributes_for :train, :station
end
