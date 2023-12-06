# frozen_string_literal: true

module Mutations
  class UpsertClient < BaseMutation

    argument :birthdate, String, required: true
    argument :company_id, ID, required: true
    argument :email, String, required: false
    argument :id, ID, required: false
    argument :name, String, required: true
    argument :phone, String, required: true
    argument :profession, String, required: false
    argument :social, String, required: false

    type Types::ClientType
    
    def resolve(
      birthdate: nil,
      company_id: nil,
      email: nil,
      id: nil,
      name: nil,
      phone: nil,
      profession: nil,
      social: nil
    )
      company = Company.find(company_id)
    
      client = id.present ? company.clients.find(id) : company.clients.build
      
      client.birthdate = birthdate
      client.email = email
      client.id = id
      client.name = name
      client.phone = phone
      client.profession = profession
      client.social = social
      
      client.save!

      client
    end
  end
end