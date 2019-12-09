ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


task :console do 
	ActiveRecord::Base.logger = Logger.new(STDOUT)
	Pry.start
end

task :clear_tables do
	User.delete_all
	Url.delete_all
end