class EventsController < ApplicationController

  include RemoteLinkPagination
  require 'will_paginate/collection'
  require 'will_paginate/array'

 
  before_action :authenticate_user!

  before_action :authenticate_user!, except: [:index, :show]
 


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
    @events = Event.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    if params[:tag_name]
 
      @tag = Tag.find_by(name: params[:tag_name])
      if @tag
        @events = @tag.events.paginate(page: params[:page], per_page: 6)
      else
        flash[:error] = "No tag related events found !"
        @events = Event.all.paginate(page: params[:page], per_page: 6)
      end
      # p "-------#{@events.length}, #{@events.kind_of? Array}--------"
    end
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

  def filter_events

    @events = Event.all
    if params[:date_from] && params[:date_from] != ''
      @events = @events.where("date >= ?", params[:date_from])
    end

    if params[:date_to] && params[:date_to] != ''
      @events = @events.where("date <= ?", params[:date_to])
    end

    if params[:where] && params[:where] != ''
      @events = @events.where("where": params[:where])
    end

    if params[:minimum_number_of_people_going] && params[:minimum_number_of_people_going] != ""
      num = params[:minimum_number_of_people_going].to_i

      @events = @events.select { |e| e.rsvps.count >= num }
    end
    if params[:maximum_number_of_people_going] && params[:maximum_number_of_people_going] != ""
      num = params[:maximum_number_of_people_going].to_i
      @events = @events.select { |e| e.rsvps.count <= num }
    
 
    end
    # @filtered_events = events.paginate(:page => 1, :per_page => 6)
    redirect_to show_filtered_events_path(events: @events)
    # render :index
  end

  def show_filtered_events
    events = []
    if params[:events] && params[:events].kind_of?(Array)
      params[:events].each do |id|
        events << Event.find(id)
      end
    end
    @filtered_events = events.paginate(page: params[:page], per_page: 6)
    
    p "-------#{@filtered_events.length}, #{@filtered_events.kind_of? Array}--------"
  end

  def link(text, target, attributes = {})
    attributes['data-remote'] = true
    super
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date,:location, :image_url, :tag_names)
  end

  def authorize_user!
    @event = Event.find_by(id: params[:id])
    unless can?(:crud, @event) 
      redirect_to events_path
      flash[:unauthorized] = "You're unauthorized to perform this action"
    end
  end

end
