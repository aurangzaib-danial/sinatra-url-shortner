class ApplicationController < Sinatra::Base
  
  enable :sessions

  register Sinatra::Flash

  set :views, 'app/views'
  set :public_folder, 'app/public'
  
  configure :development, :test do
    set :session_secret, 'local_server'
  end

  configure :production do
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end


  get '/' do
  	erb :index
  end


  helpers do 

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def host
      Sinatra::Base.production? ? request.host : request.host_with_port
    end

  end

end