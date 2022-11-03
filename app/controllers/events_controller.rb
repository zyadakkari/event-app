class EventsController < ApplicationController

  def index
    @events = Event.order(eventdate: :desc)

  end

  def show
      @event = Event.find(params[:id])
  end

  def new
    @event = Event.new()
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to :events, allow_other_host: true
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
      flash[:notice] = 'Event updated successfully'
    else
      render 'edit'
    end

  end


  def rsvp
      @event = Event.find(params[:id])
      if @event.attendees.include?(current_user)
        redirect_to @event, notice: "You are already on the list"
      else
        @event.attendees << current_user
        redirect_to @event, notice: "You have successfully rsvp-ed"
      end
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event"
  end




  private

  def event_params
    params.require(:event).permit(:eventdate, :eventname, :eventdesc)
  end

end
