class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :require_log_in

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: 'Attraction successfully created!!'
    else
      render 'new'
    end
  end

  def show
    # binding.pry
    @ride = @attraction.rides.build
  end

  def edit

  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render 'edit'

    end
  end

  def destroy

  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end

end
