class UsersController < ApplicationController

    def index
        render json: User.all, include: 'user_profile.*' ,status: :ok
        # ['user_profile', 'user_profile.user_addresses']
    end

    def show
        @user = load_user
        render json: @user, include: 'user_profile.*', status: :ok
    end

    def create
        @user = User.new(user_params)
        @user.image_file.attach(user_params[:image_file])
        if @user.valid?
            # byebug
            @user.save
            render json: @user, status: :ok
        end
    end

    def update
        @user = load_user
        if @user
            if @user.update(user_params)
                render json: @user, status: :ok
            else
                render json: {error: item.errors.full_messages}
            end
        else
            render json: {error: "user not found"}, status: :not_found
        end
    end

    protected
    def user_params
        params.permit(:user_name, :email, :password, :image_file)
    end

    def load_user
        User.find_by(id: params[:id])
    end

end



