class SessionsController < ApplicationController
    def create
        # sign user in
        @user = load_user
        if @user.nil?
            log_out!
        else
            log_in!(@user)
        end

    end

    def def new
        # present login form
    end
    

    def destroy
        # sign user out
        log_out!
    end
    
    private
    def session_params
        params.permit(:email, :password)
    end
    def load_user
        User.find_by(email: params[:email])
    end

end
