class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def new
    @user = User.new
    # debugger
  end

  def show # method used to navigate to show.html.erb and get the id from params to find the user
    @user = User.find(params[:id])
    # debugger
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to  @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
