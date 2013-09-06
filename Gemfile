source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails',                '4.0.0'
gem 'unicorn',              '4.6.2'
gem 'unicorn-worker-killer', '0.4.1'
gem 'secure_headers',       '1.0.0'
gem 'jquery-rails',         '3.0.4'
gem 'haml-rails',           '0.4'
gem 'pg',                   '0.15.1'
gem 'sass-rails',         '~> 4.0.0'
gem 'uglifier',           '>= 1.3.0'
gem 'rack-canonical-host',  '0.0.8'
gem "rails_12factor",       "0.0.2", group: :production
gem 'protected_attributes', "1.0.3"


group :development do
  gem 'foreman',            '0.63.0'
  gem 'jumpup',             '0.0.1'
  gem 'better_errors',      '0.9.0'
  gem 'binding_of_caller',  '0.7.2'
end

group :test do
  # See https://github.com/thoughtbot/shoulda-matchers/issues/270
  gem "shoulda-matchers",   github: "thoughtbot/shoulda-matchers" , branch: 'dp-rails-four'
  gem 'simplecov',          '0.7.1', require: false
  # gem 'webmock',            '1.11.0'
  # gem 'timecop',            '0.6.1'
end

group :development, :test do
  gem 'rspec-rails',        '2.13.2'
  gem 'factory_girl_rails', '4.2.1'
  gem 'pry-rails',          '0.3.1'
  gem 'dotenv-rails',       '0.8.0'
  gem 'awesome_print',      '1.1.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

