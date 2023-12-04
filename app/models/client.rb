class Client < ApplicationRecord
  belongs_to :company

  has_many :appointments

  validates_presence_of :name, :birthdate, :phone
end
