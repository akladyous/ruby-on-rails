class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:create, :destroy]

    def create
        @user = User.find_by_email(params[:email])
        if @user.nil? 
            render json: {error: "email not found"}, status: :not_found
        elsif @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: {message: "User logged in"}, status: :ok
        else
            render json: {error: "Unauthorized user"}, status: :unauthorized
        end
    end

    def destroy
        # logout
        session.delete :user_id
        render json: {message: "Logged out!"}, status: :ok
    end
end
