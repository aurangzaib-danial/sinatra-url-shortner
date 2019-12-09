class UrlsController < ApplicationController

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

end