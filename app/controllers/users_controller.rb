class UsersController < ApplicationController
  before_action :set_user, :only=> [:show, :edit, :destroy]
  before_action :current_user
  before_action :require_log_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User created successfully!!"
    else
      render :new
    end
  end

  def show
    @message = params[:message] if params[:message]
    @notice = params[:notice] if params[:notice]
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
