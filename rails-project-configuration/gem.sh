# https://bundler.io/
gem update --system
gem install rubygems-update
gem install bundler

sudo gem uninstall --all

bundle update --bundler
bundle clean --force

# remove all gems
rvm gemset empty GEMSET
# ---------------------------------------------------------------------------------------------
rvm list known
rvm reload
rvm get stable

rvm docs generate-ri
gem install gem-release
 # ---------------------------------------------------------------------------------------------
 $ rvm gemset create prova
 $ rvm gemset use prova

 To stop using the custom gemset (and switch to the default one) use one of the following:

$ rvm gemset use default # OR:
$ rvm use @default

bundle lock --add-platform x86_64-linux