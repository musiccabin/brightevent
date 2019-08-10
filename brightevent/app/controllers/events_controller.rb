class EventsController < ApplicationController
  before_action :authenticate_user, except: [:show, :index, :new]
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to(event_path(@event))
    else
      render :edit
    end
  end

  def delete
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date,:location, :image_url)
  end
end
