class Train < ApplicationRecord
  belongs_to :version, class_name: "Version", :foreign_key => "version_id"

  has_many :stop_times, class_name: "StopTime"
  has_many :stations, through: :stop_times

  accepts_nested_attributes_for :stop_times
end
