source 'https://rubygems.org'

ruby "2.1.5"

gem 'rails', '3.2.20'

gem "unicorn",              "~> 4.8.3", require: false

gem "figaro",               "~> 0.7.0"
group :development do
  gem "mysql2",               "~> 0.3.16"
end

group :production do
  gem "pg"
end

gem 'paperclip',            '~> 2.3.8'
gem "cocaine",              "~> 0.3.2"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

