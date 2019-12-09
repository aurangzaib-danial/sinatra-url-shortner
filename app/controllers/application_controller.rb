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

  post '/urls' do
  	url = Url.new(url: params[:url])
  	if url.valid_url?
      url.user_id = session[:user_id] if logged_in?
  		url.save
	  	flash[:shortened_url] = url.shorten
	  else
	  	flash[:error] = "Url not valid!"
	  end
	  redirect '/'
  end

  get '/:id_base32' do
  	url_object = Url.find_by_base32_id(params[:id_base32])
  	if url_object
  		redirect url_object.url
  	else
  		redirect '/'
  	end
  end

  delete '/urls/:id' do
    url = Url.find_by_id(params[:id])
    if logged_in? && url.user_id == session[:user_id]
      url.destroy
    end 
    redirect '/'
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