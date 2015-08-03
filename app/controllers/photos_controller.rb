class PhotosController < ApplicationController

  def index
    @photos = Photo.all.sort_by {|photo| photo[:created_at]}.reverse.first(12)
    @random_photo = Photo.find(1 + Random.rand(@photos.length))
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create!(photo_params)
    redirect_to photo_path(@photo)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :photo_url)
  end

end
