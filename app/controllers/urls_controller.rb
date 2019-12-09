class UrlsController < ApplicationController

  get '/:shortcode' do
  	url_object = Url.find_by_base32_id(params[:shortcode])
  	if url_object
  		redirect url_object.url
  	else
  		redirect '/'
  	end
  end

	post '/urls' do
		
		url = Url.new(target_url: params[:target_url])
		
		if url.valid_target_url?
			
			# url.user_id = session[:user_id] if logged_in?
			
  		url.save
			flash[:shortened_url] = url.shorten(host)
			
	  else
	  	flash[:error] = "Unable to shorten that link. It is not a valid url."
		end
		
	  redirect '/'
  end

  delete '/urls/:id' do
    url = Url.find_by_id(params[:id])
    if logged_in? && url.user_id == session[:user_id]
      url.destroy
    end 
    redirect '/'
  end

end