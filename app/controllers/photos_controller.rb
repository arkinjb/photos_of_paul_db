class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
    # @photos = Photo.all.sort_by {|photo| photo[:created_at]}.reverse.first(12)
    @random_photo = Photo.find(1 + Random.rand(Photo.all.length))
    @photos = Photo.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def show

    @comments = @photo.comments.all

  end

  def new

  end

  def create
    @photo = Photo.create!(photo_params.merge({user_id: current_user.id}))

    redirect_to photo_path(@photo)
  end

  def edit

  end

  def update

    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo.destroy
    redirect_to root_url
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :photo_url)
  end

end
