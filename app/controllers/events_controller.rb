class EventsController < ApplicationController

  def index
  end

  # def show
  #     @event = Event.find(params[:id])
  #     # @creator = @event.creator
  # end

  def new
    @user = User.find(params[:user_id])
    @event = @user.created_events.create(params[:event])

    if @event.save
      redirect_to :events, allow_other_host: true
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

#   def event_params
#     params.require(:event).permit(:eventdate)
#   end
end
