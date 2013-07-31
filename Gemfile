source 'https://rubygems.org'

gem 'rails', '3.2.14'

gem 'bson_ext'
gem 'oj'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'rack-cors', :require => 'rack/cors'

# authorization
gem 'doorkeeper'

# db
gem 'mongoid', '2.4.6'


group :development do
  gem 'jazz_hands'
  gem 'thin'
end

group :test do
  gem 'mongoid-rspec', '1.4.5'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
end

group :development, :test do
  gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'