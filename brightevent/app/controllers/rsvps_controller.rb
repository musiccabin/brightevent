class RsvpsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  def create
    event = Event.find params[:event_id]
    rsvp = Rsvp.new user: current_user, event: event
    # if !can?(:rsvp, event)
    #   redirect_to event_path, alert: "you cant RSVP to this event"
    # elsif rsvp.after_save 

    if rsvp.save
      flash[:success] =  " your day just got a bit brighter"
        redirect_to event
    end

  end
  
  def destroy
    @event = Event.find params[:event_id]
    @rsvp = Rsvp.find params[:id]
    @rsvp.destroy
    flash[:danger] = "you are no longer going to this event."
    redirect_to @event
  end



end
