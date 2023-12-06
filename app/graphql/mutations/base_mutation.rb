# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def validate_logged_in_professional
      if current_professional.blank?
        GraphQL::ExecutionError.new("Professional must be signed in.")
      end
    end

    def current_professional
      context[:current_professional]
    end
  end
end
