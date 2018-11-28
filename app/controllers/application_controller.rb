class ApplicationController < Sinatra::Base
	use Rack::Flash
	configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'url_shortner'
  end

  get '/' do
  	erb :index
  end

  post '/urls' do
  	url = Url.new(url: params[:url])
  	if url.valid_url?
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

end