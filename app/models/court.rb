class Court < ApplicationRecord
  belongs_to :arena
  has_many :bookings, dependent: :destroy

  validates :name, :available, :court_type, presence: true
end
