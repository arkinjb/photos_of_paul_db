class PhotosController < ApplicationController
  load_and_authorize_resource
  before_filter :check_for_cancel, :only => [:show]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to root_url
    end
  end

  def index
    # @photos = Photo.all.sort_by {|photo| photo[:created_at]}.reverse.first(12)
    @random_photo = Photo.find(1 + Random.rand(Photo.all.length))
    @photos = paginate_order(Photo)

    if params[:search]
      @photos = paginate_order(Photo.search(params[:search]))
    else
      @photos = paginate_order(Photo.all)
    end
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

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def paginate_order(query)
    query.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :photo_url)
  end

end
