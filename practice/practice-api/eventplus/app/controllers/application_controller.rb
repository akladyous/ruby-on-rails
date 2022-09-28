class ApplicationController < ActionController::API
    

    def log_in!(user)
        session[:user_id] = user.id
    end

    def log_out!
        session[:user_id] = nil
    end

    def current_user
        return nil if session[:user_id].nil?
        User.find(session[:user_id])
    end
end
