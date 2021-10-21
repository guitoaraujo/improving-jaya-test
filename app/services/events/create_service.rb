class Events::CreateService < ApplicationService

  def initialize(request)
    @parsed_request = JSON.parse(request.body.read)
    @event_type = parsed_request.keys[1]
  end

  def call
    Event.create(event_params)
  rescue StandardError => e
    e.message
  end

  private

  attr_accessor :parsed_request, :event_type

  def event_params
    {
      action: parsed_request['action'],
      event_type: event_type,
      event_id: parsed_request[event_type]['id'],
      event_user_name: parsed_request[event_type]['user']['login'],
      event_user_id: parsed_request[event_type]['user']['id'],
      event_number: parsed_request[event_type]['number']
    }
  end  
end


    