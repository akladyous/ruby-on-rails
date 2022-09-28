# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    respond_to :json, :html
    before_action :test
    # skip_before_action :verify_authenticity_token, only: [:create], if: :request.format.symbol == :json
    protect_from_forgery unless: -> { request.format.symbol == :json? || request.headers['Content-Type'] == 'application/json' }


    # before_action :configure_sign_in_params, only: [:create]
    
    
    # GET /resource/sign_in
    def new
        super
    end

    # POST /resource/sign_in
    def create
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        respond_to do |format|
            format.turbo_stream
            format.html { super }
            format.json { render json: resource, status: 200 and return }
        end
    end

    # DELETE /resource/sign_out
    def destroy
        super
    end

    protected

    def user_params
        params.require(:user).permit(:email, :password)
    end

    def test
        # if request.format.symbol == :json
        #     render json: { message: "Hello World" }
        # else
        #     render html: "Hello World"
        # end
        puts "current request format: #{request.format.symbol}"
    end
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
end
