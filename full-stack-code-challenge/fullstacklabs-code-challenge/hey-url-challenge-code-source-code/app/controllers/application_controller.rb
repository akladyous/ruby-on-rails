class ApplicationController < ActionController::Base
        # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    private
    def generate_short_url(max_stack=1000)
        return nil if max_stack == 1
        # render "errors/404" if max_stack == 1

        short_url = (0..4).map { |el| (65 + rand(25)).chr}.join
        if Url.short_url_exists?(short_url)
            max_stack -= 1
            generate_short_url(max_stack)
        else
            short_url
            # @short_url = short_url
        end
    end

    def is_valid_route?(short_url)
        short_url.upcase.length === 5 ? true: false
        # render "errors/404" unless params.permit(:short_url)[:short_url].upcase.length === 5
    end

    def is_valid_url?(original_url)
        uri = URI.parse(original_url)
        if uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
            true
        else
            false
        end
    end

    def original_url_params
        params.require(:url).permit(:original_url)
    end


    def url_params
        params.permit(:url, :short_url)
    end

    def get_user_platform
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        return browser.platform.name
    end

    def get_user_browser
        user_agent = request.env['HTTP_USER_AGENT']
        browser = Browser.new(user_agent, accept_language: "en-us")
        return browser.name
    end

    def render_not_found
        render json: {error: "Record not Found"}, status: :not_found
    end
end
