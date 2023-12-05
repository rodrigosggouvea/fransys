module Mutations
  class CreateProfessional < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :company_id, ID, required: true
    argument :phone, String, required: false
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::ProfessionalType

    def resolve(name: nil, company_id: nil, phone: nil, auth_provider: nil)
      Professional.create!(
        name: name,
        company_id: company_id,
        phone: phone,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )
    end
  end
end