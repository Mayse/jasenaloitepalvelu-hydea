source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
gem 'pg', '~> 0.20'

group :development, :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'
	# Call 'byebug' anywhere in the code to stop execution and get a debugger console
	gem 'byebug'
	# Rails update just in case we use assigns and assert templates
	gem 'rails-controller-testing'
        gem 'rspec-rails', '~> 3.5'
end

group :development do
	# Access an IRB console on exception pages or by using <%= console %> in views
	gem 'web-console', '~> 2.0'

	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
end

group :production do
	gem 'rails_12factor'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
end

# Use for FAQ markdown
gem 'redcarpet'
# Use for Capybara session
gem 'rack_session_access'
# Use Faker to add test data to dev
gem 'faker'
# Use dotenv to set up some variables
gem 'dotenv-rails'
# Haka authentication
gem 'ruby-saml'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.1', '>= 3.1.12'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Bootsrtap for stylesheets
gem 'bootstrap-sass', '3.3.6'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use xmlsec-ruby to validate metadata
gem 'xmlsec-ruby', '~> 0.0.7'
# add flags
gem 'famfamfam_flags_rails'
# add social media share buttons
gem 'social-share-button', '~> 0.10.0'
# Sort ideas
gem 'ransack', '~> 1.8', '>= 1.8.2'
# Puma development web server
gem 'puma', '~> 3.8', '>= 3.8.2'
# Match Heroku timeout to Puma
gem 'rack-timeout', '~> 0.4.2'
# Limit posts on page
gem 'will_paginate', '~> 3.1.0'
