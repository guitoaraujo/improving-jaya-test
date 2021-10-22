# frozen_string_literal: true

module Events
  class CreateService < ApplicationService
    def initialize(params)
      super

      @parsed_request = params[:parsed_request]
      @event_type = params[:event_type]
    end

    def call
      Event.create(event_params)
    rescue StandardError => e
      e.message
    end

    private

    attr_accessor :parsed_request, :event_type

    def event_params
      event_type_key = parsed_request[event_type]
      {
        action: parsed_request['action'],
        event_type: event_type,
        event_id: event_type_key['id'],
        event_user_name: event_type_key['user']['login'],
        event_user_id: event_type_key['user']['id'],
        event_number: event_type_key['number']
      }
    end
  end
end
