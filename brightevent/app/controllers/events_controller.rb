class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :new]

  def new
    @event = Event.new
  end
  
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

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

  private
  def event_params
    params.require(:event).permit(:title, :description, :date,:location, :image_url)
  end

end
