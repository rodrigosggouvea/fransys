# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_professional, mutation: Mutations::CreateProfessional
    field :sign_in_professional, mutation: Mutations::SignInProfessional
    field :upsert_client, mutation: Mutations::UpsertClient
    field :upsert_appointment, mutation: Mutations::UpsertAppointment
  end
end
