# frozen_string_literal: true

module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :birthdate, GraphQL::Types::ISO8601Date, null: false
    field :phone, String, null: false
    field :profession, String
    field :email, String
    field :social, String
    field :company, Types::CompanyType
  end
end
