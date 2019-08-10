class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])

  end

  def index
    @events = Event.all.order("created_at DESC")

   end


   def create
    @event = Event.new event_params
    @event.user_id = current_user.id
    if @event.save
      redirect_to @event
    else 
      render :new
    end
  end

end
