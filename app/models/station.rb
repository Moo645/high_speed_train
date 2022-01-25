class Station < ApplicationRecord
  has_many :stop_times
  has_many :trains, through: :stop_times
  
  accepts_nested_attributes_for :stop_times
end
