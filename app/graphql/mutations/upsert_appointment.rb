# frozen_string_literal: true

module Mutations
  class UpsertAppointment < BaseMutation

    argument :id, ID, required: false
    argument :client_id, ID, required: true
    argument :professional_id, ID, required: true
    argument :scheduled_at, GraphQL::Types::ISO8601Date, required: true

    type Types::AppointmentType

    def resolve(
      id: nil,
      client_id: nil,
      professional_id: nil,
      scheduled_at: nil
    )
      validate_logged_in_professional

      company = context[:current_professional].company

      appointment = id.present? ? company.appointments.find(id) : company.appointments.build

      appointment.professional = company.professionals.find(professional_id)
      appointment.client = company.clients.find(client_id)
      appointment.scheduled_at = scheduled_at

      appointment.save!

      appointment
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end