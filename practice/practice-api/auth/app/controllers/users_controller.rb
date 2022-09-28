class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:show, :create, :email]

    def show
        if current_user
            render json: current_user, status: :ok
        else
            render json: {error: "Unathorized User!"}, status: :unauthorized
        end
    end

    def create
        @user = User.new(signup_params)
        # debugger
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            # login(@user)
            UserMailer.with(user: current_user).welcome_msg.deliver_now
            debugger
            render json: @user, status: :created
        else
            render json: {error: "error"}, status: :unprocessable_entity
        end
    end

    def email
        test = UserMailer.with(user: current_user).welcome_msg.deliver_now
        render json: {message: "email sent ok!!"}
    end

    private
    def signup_params
        params.permit(:email, :password, :password_confirmation)
    end
end
