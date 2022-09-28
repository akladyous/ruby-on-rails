# frozen_string_literal: true

class ApplicationController < ActionController::Base
    

    private 

    def original_url_params
        params.require(:url).permit(:original_url)
    end

    def is_valid_url?
        uri = URI.parse(original_url_params[:original_url])
        if uri.kind_of? URI::HTTP or uri.kind_of? URI::HTTPS
            return true
        else
            flash[:notice] = "invalid url format: #{original_url}"
            redirect_to root_path
        end
    end

    def generate_short_url
        sulg = (0..4).map { (65 + rand(25)).chr }.join
        return sulg if !Url.short_url_exists?(sulg)
    end

    def get_user_browser
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        return browser.name
    end

    def get_user_platform
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        return browser.platform.name
    end

    def is_valid_route?(short_url)
        # short_url = params.permit(:short_url)[:short_url]
        # if short_url.upcase === short_url && short_url.length === 5
        # flash[:notice] = "wrong url: #{short_url}"
        # redirect_to root_path
        # render "errors/404"
        if short_url.upcase.length === 5
            true
        else
            false
        end
    end
    
end
