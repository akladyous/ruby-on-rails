class LikesController < ApplicationController
  before_action :set_post, only: [:show, :create, :destroy]
  before_action :set_likes, only: :show

  def show
  end

  def create
    @post.likes.where(user_id: current_user.id).first_or_create
    respond_to do |format|
      format.html { redirect_to @post }
      format.json { render json: @post.likes, status: :ok  }
    end
  end

  def destroy
    @post.likes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to @post }
    end
  end

  private
  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
  def set_likes
    @likes = @post.likes
  end
end
