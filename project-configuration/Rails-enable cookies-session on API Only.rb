
Configuring Rails app to use cookies and sessions
Inside config/application.rb
module MyApp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.action_dispatch.cookies_same_site_protection = :strict # ensures that cookies are only shared on the same domain.
  end
end


Inside app/controllers/application_controller.rb give access to cookies to all subsequent controllers

class ApplicationController < ActionController::API
  include ActionController::Cookies
end
