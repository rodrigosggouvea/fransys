class Company < ApplicationRecord
  has_many :appointments
  has_many :clients
  has_many :professionals

  validates :name, presence: true, uniqueness: true
end
