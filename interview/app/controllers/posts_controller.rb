class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show; end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        flash[:success] = 'Post successfully created'
        format.html { redirect_to post_path(@post) }
      else
        format.html { render :new, error: "Error create new post" }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :un_processable_entiry, error: "Error updating post" }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was successfully destroyed" }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
