class UrlsController < ApplicationController
    # before_action :is_valid_route?, only: :visit
    # before_action :generate_short_url, only: :create

    def index
        @url = Url.new
        @urls = Url.all
        respond_to do |format|
            format.json { render json: @urls, status: :ok }
            format.html #{ render index, notice: "URL was successfully created" }
        end
    end
    def create
        short_url = generate_short_url
        return redirect_to root_path, notice: "internal error" unless short_url
        # @short_url
        
        original_url = original_url_params[:original_url]
        return redirect_to root_path, notice: "invalid url" unless is_valid_url?(original_url)
        
        @url = Url.new(short_url: short_url, original_url: original_url)
        if @url.save
            redirect_to root_path, notice: "Uri was successfully created."
        else
            redirect_to root_path flash[:notice] = "invalid url format: #{@url.errors.full_messages}"
        end
    end
    def show
        @url = Url.find_by_short_url(url_params[:url])
        if @url
            @daily_clicks = Url.daily_clicks(@url.id)
            @browsers_clicks = Url.browsers_clicks(@url.id)
            @platform_clicks = Url.platform_clicks(@url.id)
            render :show
        else
            render "errors/404"
        end
    end
    def visit
        short_url = url_params[:short_url]
        if is_valid_route?(short_url)
            @url = Url.find_by(short_url: short_url.upcase)
            if @url.nil?
                render "errors/404"
            else
                @url.increment!(:clicks_count)
                @url.clicks.create(browser: get_user_browser, platform: get_user_platform)
                redirect_to @url.original_url
            end
        else
            render "errors/404"
        end
    end
end