class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :authenticate_webhook!, only: %i[create]

  def index
    event_type = params[:event_type]
    event_number = params[:event_number]
    events = Event.where(event_type: event_type, event_number: event_number)

    render json: events
  end

  def create
    Event.create(event_params)
  end

  private

  def event_params
    parsed_request = JSON.parse(request.body.read)
    event_type = parsed_request.keys[1]
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