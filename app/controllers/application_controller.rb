class ApplicationController < Sinatra::Base
  
  before do
    @title = 'URL Shortener'
  end  

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
  	erb :'index.html'
  end

  helpers do 

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def host

      if Sinatra::Base.production?
        'https://' + request.host
      else
        'http://' + request.host_with_port
      end

    end

    def temporary_urls
      session[:temporary_urls] ||= []
    end

    def find_temp_url_hash(id)
      temporary_urls.detect{|url_hash| url_hash[:id] == id}
    end

    def find_temp_url_hash_by_target(target)
      temporary_urls.detect {|url_hash| url_hash[:target_url] == target}
    end

    def history_urls
      if logged_in?
        @history_urls ||= current_user.urls.order(created_at: :desc)

      else
        temporary_urls.map do |url_hash|
          Url.new(url_hash)
        end.reverse
      end
    end

  end # Helpers

end