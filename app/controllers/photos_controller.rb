class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
    @random_photo = Photo.find(Photo.all.map(&:id).sample)
    @photos = paginate_order(Photo)

    if params[:search]
      @photos = paginate_order(Photo.search(params[:search]))
    else
      @photos = paginate_order(Photo.all)
    end

  end

  def show
    @comments = @photo.comments.all
    @comment = Comment.new
  end

  def new
  end

  def create
    @photo = current_user.photos.create!(photo_params)
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

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def paginate_order(query)
    query.order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end

  def add_favorite
    @user = current_user
    FavoritePhoto.create(user: current_user, photo_id: params[:id])
    redirect_to @photo
  end

  def remove_favorite
    @user = current_user
    entry = FavoritePhoto.where(user: current_user, photo_id: params[:id])
    entry.destroy_all
    redirect_to @photo
  end


  private

  def photo_params
    params.require(:photo).permit(:title, :photo_url, :image)
  end

end
