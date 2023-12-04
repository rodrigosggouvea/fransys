class Professional < ApplicationRecord
  belongs_to :company

  has_many :appointments

  validates_presence_of :name, :email, :password
end
