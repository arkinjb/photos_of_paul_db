class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
    # while this is clever, this is a pretty inefficient way to find a random
    # photo (since it has to get all photos into ruby, then get their IDs)
    # slighly better would be:
    @random_photo = Photo.find(Photo.pluck(:id).sample)
    # but this still has to return an array of all IDs, which could be in the
    #1000s or 1,000,000s
    # Instead, the best way would be something like:
    photo_count = Photo.count
    @random_photo = Photo.limit(1).offset(rand(photo_count)).first

    @random_photo = Photo.find(Photo.all.map(&:id).sample)
    @photos = paginate_order(Photo)

    # nice use of conditionals to reuse code for search and index!
    if params[:search]
      @photos = paginate_order(Photo.search(params[:search]))
    else
      @photos = paginate_order(Photo.all)
    end

  end

  def show
    # technically you don't need the .all on @photo.comments (it's implied!)
    @comments = @photo.comments.all
    @comment = Comment.new
  end

  def new
  end

  def create
    @photo = current_user.photos.create!(photo_params)
    redirect_to @photo
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to @photo
  end

  def destroy
    @photo.destroy
    redirect_to root_url
  end

  def self.search(query)
    # nice job making a simple search!
    # one minor suggestion would be to use "ILIKE" instead of "LIKE", as it
    # is case insensitive (hence the 'I' in the name)
    where("title like ?", "%#{query}%")
  end

  # I like that you broke this out into a method, but since it's not a routable
  # action, it should be below in the `private` section
  def paginate_order(query)
    query.order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end

  # well done with these two methods!
  def add_favorite
    FavoritePhoto.create(user: current_user, photo_id: params[:id])
    redirect_to @photo
  end

  def remove_favorite
    entry = FavoritePhoto.where(user: current_user, photo_id: params[:id])
    entry.destroy_all
    redirect_to @photo
  end


  private

  def photo_params
    params.require(:photo).permit(:title, :photo_url, :image)
  end

end
