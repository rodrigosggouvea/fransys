# frozen_string_literal: true

module Mutations
  class CreateProfessional < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false
    argument :company_id, ID, required: true
    argument :name, String, required: true
    argument :phone, String, required: false

    type Types::ProfessionalType

    def resolve(name: nil, company_id: nil, phone: nil, auth_provider: nil)
      Professional.create!(
        company_id: company_id,
        email: auth_provider&.[](:credentials)&.[](:email),
        name: name,
        password: auth_provider&.[](:credentials)&.[](:password),
        phone: phone
      )
    end
  end
end