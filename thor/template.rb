require 'debug'
self.source_paths.push __dir__
# source_paths = File.expand_path('templates', __dir__)

say "New rails application with devise gem\n"

current_ruby = ask("Which version of ruby? 1.8.7 or 1.9.2?")

run "rvm gemset create #{app_name}"
run "rvm #{current_ruby}@#{app_name}"
create_file ".rvmrc", "rvm use #{current_ruby}@#{app_name}"

gem 'devise'
gem_group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'htmlbeautifier'
  gem 'solargraph', '~> 0.45.0'
  gem 'solargraph-rails', '~> 0.3.1'
  gem 'ruby-prof', '~> 0.16.2'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master', require: false
end

after_bundle do
  generate "devise:install"
  generate "devise", "User", "admin:boolean"

  environment "config.application_name = Rails.application.class.module_parent_name"
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

  in_root do
    migration = Dir.glob("db/migrate/*").max_by{ |f| File.mtime(f) }
    gsub_file migration, /:admin/, ":admin, default: false"

  end

  gsub_file "app/models/user.rb", /:recoverable, :rememberable, :validatable/, ":recoverable, :rememberable, :validatable, :confirmable, :lockable"

  gsub_file "config/initializers/devise.rb", /  # config.secret_key = .+/, "  config.secret_key = Rails.application.credentials.secret_key_base"

  inject_into_file 'config/initializers/devise.rb', after: "# ==> Warden configuration\n" do <<-EOF
    config.warden do |manager|
      manager.failure_app = TurboFailureApp
    end
    EOF
  end
  inject_into_file "config/initializers/devise.rb", before: "# frozen_string_literal: true" do <<~EOF
    class TurboFailureApp < Devise::FailureApp
      def respond
          if request_format == :turbo_stream
          redirect
          else
              super
          end
      end

      def skip_format?
        %w(html turbo_stream */*).include? request_format.to_s
      end
    end
    EOF
  end

  # route "root 'home#index'"
  generate "controller home index"
  gsub_file 'config/routes.rb', /^\s+get\s'home\/index'/, "\troot 'home#index'"

  get "https://raw.githubusercontent.com/akladyous/rails-devise-template/main/.solargraph.yml", ".solargraph.yml"

  template "#{__dir__.to_s}/app/views/home/index.html.erb", "app/views/home/index.html.erb"
end
