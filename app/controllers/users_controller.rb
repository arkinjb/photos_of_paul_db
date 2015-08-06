class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # new user is valid and can be saved
      sign_in @user
      redirect_to root_url
    else
      # render sign up page with errors displayed
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite_photos = @user.favorite_photos.all.order("created_at DESC").paginate(page: params[:page], per_page: 40)
    @photos = Photo.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end



  private

    def user_params
      params.require(:user).permit(:username, :name, :password, :password_confirmation, :admin)
    end

end
