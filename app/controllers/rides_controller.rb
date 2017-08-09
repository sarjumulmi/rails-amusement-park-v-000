class RidesController < ApplicationController

  def create
    # raise params.inspect
    @ride = Ride.create(ride_params)
    @message = @ride.take_ride
    if @message==""
      @notice = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(@ride.user, :message=>@message, :notice=>@notice)

  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
