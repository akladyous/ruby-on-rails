
# Terminal
rails g resource user email:uniq password:digest
rails g controller sessions new


# Gemfile
gem 'bcrypt', '~> 3.1.7'

# models/user.rb
class User < ApplicationRecord
  has_secure_password
end

# config/routes.rb
Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'welcome#index'
end



# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      session[:user_id] = @user.id
      # Call out mail job
      redirect_to root_path, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end


# sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    # email ✅ | password ✅ | 200-300ms
    # email ❌ | password ❌/✅ | 10ms
    # email ✅ | password ❌ | 200-300ms

    @user = User.find_by(email: params[:email])
    if @user.nil?
      sleep rand(200..300) / 1000.0
      flash.now.alert = 'Email or password is invalid'
      render :new
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in.'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  # DELETE /sessions/:id
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out!'
  end
end


# application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_session_path, alert: 'You must sign in first.'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def user_signed_in?
    current_user
  end
  helper_method :user_signed_in?
end