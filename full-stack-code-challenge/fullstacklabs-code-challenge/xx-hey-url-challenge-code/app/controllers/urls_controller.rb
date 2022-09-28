# frozen_string_literal: true
class UrlsController < ApplicationController
    # before_action :is_valid_route?, only: [:visit]
    before_action :is_valid_url?, only: [:create]

    def index
        # recent 10 short urls
        @url = Url.new
        @urls = Url.latest
        respond_to do |format|
            # debugger
            puts "--------------------------------"
            puts format
            puts "--------------------------------"
            format.json { render json: @urls,
                layout: false ,status: :ok}
            format.html { render :index, status: :ok }
        end
    end

    def create
        shorten_url = generate_short_url
        original_url = original_url_params[:original_url]
        @url = Url.new(original_url: original_url, short_url: shorten_url)
        if @url.save
            redirect_to root_path, notice: "Uri was successfully created."
        else
            redirect_to root_path flash[:notice] = "invalid url format: #{@url.errors.full_messages}"
        end
    end

    def show
        @url = Url.find_by_id(url_params[:url])
        respond_to do |format|
            if @url
                @daily_clicks = Url.daily_clicks
                @browsers_clicks = Url.browsers_by_clicks(@url.id)
                @platform_clicks = Url.platforms_by_clicks(@url.id)

                format.json { 
                    render json: @url,
                    layout: false,
                    status: :ok
                }
                
                
                
                format.html { render :show, status: :created, location: @url}

            end
        end


    end

    def visit

        short_url_params = params.permit(:short_url)[:short_url]
        if is_valid_route?(short_url_params)
            @url = Url.find_by(short_url: short_url_params.upcase)
            if !@url.nil?
                @url.increment!(:clicks_count)
                @url.clicks.create(browser: get_user_browser, platform: get_user_platform)
            
                redirect_to @url.original_url
            end
            # render plain: 'redirecting to url...'
        else
            render "errors/404"
        end
    end

    def url_params
        params.permit(:original_url, :url, :short_url)
    end

end
