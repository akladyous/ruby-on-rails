class UserProfilesController < ApplicationController
    # ActionController::Parameters.action_on_unpermitted_parameters = :rais / :log
    def index
        # debugger
        unless user_id_params.permitted?
            render json: {error: "Unauthorized request!"}, status: :unauthorized
        end
        @user = load_user
        render json: @user.user_profile, status: :ok
        # render json: UserProfile.all, status: :ok
    end

    def show
        # @user = load_user
        render json: UserProfile.find_by(id: self.params[:id])
    end

    protected
    def load_user 
        User.find_by(id: user_id_params[:user_id])
    end
    def profile_params
        params.permit(:user_id, UserProfile.column_names -  ["created_at", "updated_at"] )
        # params.permit(:first_name,:last_name,:home_phone,:cell_phone,:job_title,:company,:website,:blog, :user_id)
        # params.permit(:first_name,:last_name,:home_phone,:cell_phone,:job_title,:company,:website,:blog)
    end
    def user_id_params
        params.permit(:user_id)
    end
end
