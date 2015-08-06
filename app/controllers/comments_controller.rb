class CommentsController < ApplicationController
  before_action :get_photo_id
  load_and_authorize_resource

  def new
  end

  def create

    @comment = current_user.comments.create!(comment_params)
    redirect_to photo_path(@photo)
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private
  def get_photo_id
    @photo = Photo.find(params[:photo_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :photo_id)
  end

end
