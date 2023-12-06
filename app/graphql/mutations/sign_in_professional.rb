# frozen_string_literal: true

module Mutations
  class SignInProfessional < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :professional, Types::ProfessionalType, null: true

    def resolve(credentials: nil)
      return unless credentials

      professional = Professional.find_by email: credentials[:email]

      return unless professional
      return unless professional.authenticate(credentials[:password])

      token = AuthToken.token_for_professional(professional)

      context[:session][:token] = token

      { professional: professional, token: token }
    end
  end
end