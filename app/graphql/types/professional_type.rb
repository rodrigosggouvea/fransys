# frozen_string_literal: true

module Types
  class ProfessionalType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :company, Types::CompanyType, null: false
    field :phone, String
  end
end
