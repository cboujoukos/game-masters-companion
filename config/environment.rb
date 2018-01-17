require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => "db/development.sqlite"
)
require 'sinatra/content_for'
require_all 'app'
