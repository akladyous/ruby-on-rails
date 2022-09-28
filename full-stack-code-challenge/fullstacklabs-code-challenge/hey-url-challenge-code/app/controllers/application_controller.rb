# frozen_string_literal: true

class ApplicationController < ActionController::Base


    def generate_short_url(max_stack=65780)
        return nil if max_stack == 1
        short_url = (0..4).map{ |el| (65 + rand(25) ).chr }.join
        if Url.exists?(short_url: short_url)
            max_stack -= 1
            generate_short_url(max_stack)
        else
            short_url
        end
    end

    def valid_route?
        short_url = url_params[:short_url]
        @url  = Url.find_by(short_url: short_url)
        if @url.nil?
            render "errors/404"
            #  unless url_params[:short_url].upcase.length == 5
        else
            @url
        end
        # short_url.upcase.length == 5 ? true : false
    end

    def valid_url?(url)
        url = URI.parse(url)
        if url.kind_of?(URI::HTTP) or url.kind_of?(URI::HTTPS)
            true
        else
            false
        end

    end

    def user_browser
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        browser.name
    end

    def user_platform
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        browser.platform.name
    end


    def original_url_params
        params.require(:url).permit(:original_url)
    end

    def url_params
        params.permit(:url, :short_url)
    end
end
