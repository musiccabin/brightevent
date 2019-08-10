class RsvpsController < ApplicationController

  def create
    event = Event.find params [:event_id]
    rsvp = Rsvp.new user: current_user, event: event
    # if !can?(:rsvp, event)
    #   redirect_to event_path, alert: "you cant RSVP to this event"
    # elsif rsvp.after_save 

    if rsvp.save
        redirect_to event.path, notice: " your day just got a bit brighter"
    end

  end


  def destroy
    event = Event.find params [:event_id]
    rsvp = Rsvp.find params[:id]
    @rsvp.destroy
    redirect_to event_path

  end



end
