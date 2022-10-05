class UsersController < ApplicationController


    def index
        render json: User.all, status: :ok
    end

    def show
        # byebug
        @user = load_user
        render json: @user, status: :ok
    end

    def create
        # byebug
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

    private
    def user_params
        params.permit(:user_name, :email, :password, :image_file)
    end

    def load_user
        User.find_by(id: params[:id])
    end
end
