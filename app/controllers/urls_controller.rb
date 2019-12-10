class UrlsController < ApplicationController

  get '/:shortcode' do
		url = Url.find_by_shortcode(params[:shortcode])
		
  	if url
  		redirect url.target_url
  	else
  		redirect '/'
  	end
  end

	post '/urls' do
		
		if Url.valid_target_url?(params[:target_url])
			
			if logged_in?
				url = Url.find_or_create_by(target_url: params[:target_url], user_id: session[:user_id])
			else
				url = Url.create(target_url: params[:target_url])
			end
			
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