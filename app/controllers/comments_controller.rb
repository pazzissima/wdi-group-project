class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @clip = Clip.find(params[:clip_id])
    @comments = @clip.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    clip_id = params[:clip_id]
    comment_params = params.require(:comment).permit(:body)
    comment_params[:user_id] = current_user.id
    comment = Comment.create(comment_params)
    comment.clip = Clip.find(clip_id)
    comment.save
    redirect_to clip_path(clip_id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
