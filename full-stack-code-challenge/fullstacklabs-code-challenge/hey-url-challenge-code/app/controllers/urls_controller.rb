# frozen_string_literal: true

class UrlsController < ApplicationController
    before_action :valid_route?, only: :visit



    def index
        # recent 10 short urls
        @url = Url.new
        @urls = Url.latest
    end

    def create
        short_url = generate_short_url
        return redirect_to root_path, notice: "internal server error" unless short_url

        original_url = original_url_params[:original_url]
        return redirect_to root_path, notice: "invalid url" unless valid_url?(original_url)

        @url = Url.new(short_url: short_url, original_url: original_url)
        if @url.save
            redirect_to root_path, notice: "URL saved successfully"
        else
            redirect_to root_path, notice: "valid url format #{@url.errors.full_messages}"
        end
    end

    def show
        @url = Url.find_by(:short_url => url_params[:url])
        @daily_clicks = Url.daily_clicks(@url.id)

        @browsers_clicks = Url.browsers_clicks(@url.id)
        
        @platform_clicks = Url.platform_clicks(@url.id)
    end

    def visit
        @url.increment!(:clicks_count)
        @url.clicks.create(browser: user_browser, platform: user_platform)
        redirect_to @url.original_url
        # url_params -> short_url
        # if it is a valid short_url
        # short_url = url_params[:short_url]
        # if valid_route?(short_url)
        # @url = Url.find_by(short_url: short_url.upcase)
        # if @url.nil?
            # @url.increment!(:clicks_count)
            # @url.clicks.create(browser: user_browser, platform: user_platform)
            # redirect_to @url.original_url
        # else
            # render "errors/404"    
        # end
        # else
            # render "errors/404"
        # end
    end
end
