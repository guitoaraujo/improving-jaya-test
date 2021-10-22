# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :authenticate_webhook!, only: %i[create]

  def index
    response = ::Events::IndexService.call(params)

    render json: response
  end

  def create
    response = ::Events::CreateService.call(event_params)

    render json: response
  end

  private

  def event_params
    parsed_request = JSON.parse(request.body.read)
    {
      parsed_request: parsed_request,
      event_type: parsed_request.keys[1]
    }
  end
end
