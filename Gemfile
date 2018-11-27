# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass', "~> 2.4"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise', "~> 4.5"
gem 'jquery-rails', "~> 4.3"
gem 'inline_svg', "~> 1.3"
gem 'kaminari', "~> 1.1"
gem 'omniauth-google-oauth2', "~> 0.5"
gem "rack", "~> 2.0"
gem 'rack-cors', "~> 1.0", require: 'rack/cors'
gem 'sparkpost_rails', "~> 1.5"
gem 'redis', '~> 4.0', '>= 4.0.3'
gem 'pundit', "~> 2.0"

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.3', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'dotenv-rails', "~> 2.5"
  gem 'byebug', "~> 10.0", platforms: %i[mri mingw x64_mingw]
  gem 'capybara', "~> 3.7"
  gem 'factory_bot_rails', "~> 4.11"
  gem 'launchy', "~> 2.4"
  gem 'pry', "~> 0.11"
  gem 'rspec-rails', "~> 3.8"
  gem 'shoulda-matchers', "~> 3.1"
  gem 'simplecov', "~> 0.16", require: false
  gem "letter_opener", "~> 1.6"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.1', '< 3.2'
  gem 'web-console', '~> 3.7'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'faker', "~> 1.9"
  gem 'spring', "~> 2.0"
  gem 'spring-watcher-listen', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
