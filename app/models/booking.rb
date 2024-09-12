class Booking < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validates :start_time, :end_time, presence: true
end
