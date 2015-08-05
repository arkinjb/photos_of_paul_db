class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:sign_in_message] = 'Welcome to the Photos of Paul Club!'
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite_photos = @user.favorite_photos.all.order("created_at DESC").paginate(page: params[:page], per_page: 40)
    @photos = Photo.all
  end



  private

    def user_params
      params.require(:user).permit(:username, :name, :email, :password)
    end

end
