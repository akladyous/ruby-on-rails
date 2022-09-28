class FriendshipsController < ApplicationController
  # before_action :set_friendship, only: %i[show edit update destroy]

  def create
    @friendship = current_user.followed_users.build(followed_id: params[:followed_id])
    if @friendship.save
      flash[:notice] = 'Friendship was successfully created.'
    else
      flash[:error] = 'Error'
    end
    redirect_back_or_to root_path
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:follower_id, :followed_id, :status)
  end
end
