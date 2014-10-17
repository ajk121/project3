class AttendancesController < ApplicationController

  def create 
    @event = Event.find(params[:event_id])
    @event.attendances.new(user_id: current_user.id)
    @event.save

    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: "You are attending this event" }
    end 
  end



end 