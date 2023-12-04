class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :professional

  validates :scheduled_at, presence: true
end
