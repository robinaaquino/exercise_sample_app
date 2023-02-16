class UsersController < ApplicationController
  def new
  end

  def show # method used to navigate to show.html.erb and get the id from params to find the user
    @user = User.find(params[:id])
    debugger
  end



end
