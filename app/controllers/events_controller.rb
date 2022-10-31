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



  private

  def event_params
    params.require(:event).permit(:eventdate, :eventname, :eventdesc)
  end

end
