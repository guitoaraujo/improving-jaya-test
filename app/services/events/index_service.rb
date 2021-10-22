# frozen_string_literal: true

module Events
  class IndexService < ApplicationService
    def initialize(params)
      super

      @event_type = params[:event_type]
      @event_number = params[:event_number]
    end

    def call
      Event.where(event_type: @event_type, event_number: @event_number)
    end
  end
end
