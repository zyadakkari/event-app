class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @events = @user.created_events
  end

end
