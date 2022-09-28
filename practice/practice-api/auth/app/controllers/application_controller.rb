class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authenticate_user


    private
    def authenticate_user
        unless current_user
            render json: {error: "User not authorized"}, status: :unauthorized
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def login user
        session[:user_id] = user.id
    end

    def logout
        session.delete user_id
    end

end
