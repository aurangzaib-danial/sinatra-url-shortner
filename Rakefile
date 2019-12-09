require_relative './config/environment'
require 'sinatra/activerecord/rake'


desc 'Interactive console for models' 
task :console do
	if ActiveRecord::Base.connection.migration_context.needs_migration?
		raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
	end
	
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

def reload
  load_all 'app/models'
end