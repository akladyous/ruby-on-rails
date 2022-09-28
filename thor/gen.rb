require 'debug'
require 'thor'
require 'thor/group'

class ErbGen < Thor::Group
  include Thor::Actions
  desc 'Generate a new filesystem structure'

  def ignore
    append_to_file ".gitignore" do <<~EOF
      \n/app/assets/builds/*
      /config/credentials/development.key
      /config/credentials/production.key
      /config/credentials/environment.key
      /config/initializers/secret_token.rb
      /public/assets/builds/*
    EOF
    end
  end

  def self.source_root
    File.dirname(__FILE__) + '/../../templates'
  end

  def copy_file
    copy_file "app/views/home/index.html.erb", "app/views/home/index.html.erb"
  end

  def temp
    template "app/views/home/index.html.erb"
  end

  def regex
    replacement = "xxxxxxxxxx"
    gsub_file 'routes.rb', /^\s+get\s'home\/index'/, "\troot 'home#index'"
  end

  def github
    get "https://raw.githubusercontent.com/akladyous/rails-devise-template/main/.solargraph.yml", ".solargraph.yml"
  end

  def clone
    get "https://github.com/akladyous/rails-devise-template/tree/main/devise" do |content|
        debugger
    end
  end

  def create_config_file
    create_file 'config.yml', 'prova create file'
  end

  def create_git_files
    copy_file 'gitignore', '.gitignore'
    create_file 'images/.gitkeep'
    create_file 'text/.gitkeep'
  end

  def create_output_directory
    empty_directory 'output'
  end
end
