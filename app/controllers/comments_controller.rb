class CommentsController < ApplicationController
  before_action :get_photo_id

  def new
    @comment = Comment.new
  end

  def create
    @comment = @photo.comments.create!(comment_params.merge({user_id: current_user.id}))
    redirect_to photo_path(@photo)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private
  def get_photo_id
    @photo = Photo.find(params[:photo_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
