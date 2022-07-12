class Reservation < ApplicationRecord
  belongs_to :train, foreign_key: "train_id"
  accepts_nested_attributes_for :train

  # validates_presence_of :reservation_code, :train_id, :ori_stop_time_id, :des_stop_time_id, :date
  def self.gen_reservation_code
    SecureRandom.hex(10)
  end
end
