class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :authenticate_webhook!, only: %i[create]

  def index
    response = ::Events::IndexService.call(params)

    render json: response
  end

  def create
    response = ::Events::CreateService.call(request)
    
    render json: response
  end
end