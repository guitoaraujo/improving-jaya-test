class EventsController < ApplicationController
  before_action :authenticate!, only: %i[create]
  
  def create
    puts "ta da"
  end
end