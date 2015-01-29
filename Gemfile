source 'https://rubygems.org'
ruby '2.0.0'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Sintra database
gem 'sinatra-sequel'

gem 'activesupport', '~>4.1'
gem 'activerecord', '~>4.1'

gem 'rake'

gem 'shotgun'

gem 'bcrypt-ruby'

gem 'pry'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
  gem 'sqlite3'

end 

group :production do
  gem 'pg' 
end
