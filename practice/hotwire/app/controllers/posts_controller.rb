class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show #posts/1
  end

  def edit #posts/1/edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
          format.html { redirect_to posts_path, notice: "post successfully created"}
          format.turbo_stream
          # format.turbo_stream do
          #   render turbo_stream: [
          #     turbo_stream.prepend("all_posts", @post),
          #     turbo_stream.update(Post.new, "")
          #   ]
          # end
      else
        format.html { render :new, status: :unprocessable_entity}
        format.turbo_stream
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.update(Post.new, partial: "posts/form", locals: {post: @post})
        # end
      end
    end
  end

  def edit
  end

  def update # put/patch post/1
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "post updated successfully updated"}
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(@post, partial: 'posts/post', locals: { post: @post })
        end
      else
        format.html { render :edit, status: :unprocessabile_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream(@post, "posts/form", locals: {post: @post})
        end
      end
    end
  end

  def destroy #delete posts/1
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "post successfully deleted" }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

  protected
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
