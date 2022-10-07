class Posts::CommentsController < ApplicationController



  private
  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
