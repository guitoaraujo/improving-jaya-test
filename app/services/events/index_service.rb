class Events::IndexService < ApplicationService

  def initialize(params)
    @event_type = params[:event_type]
    @event_number = params[:event_number]
  end

  def call
    Event.where(event_type: @event_type, event_number: @event_number)
  rescue StandardError => e
    e.message
  end
end


    