class UrlsController < ApplicationController

  get '/:shortcode' do
		url = Url.find_by_shortcode(params[:shortcode])
		
  	if url
  		redirect url.target_url
  	else
  		redirect '/'
  	end
	end
	
	get '/urls/:id' do
		@url = Url.find_by_id(params[:id])

		if @url && url_belongs_to_user?
			erb :'urls/show.html'
		else
			redirect '/'
		end
	end

	patch '/urls/:id' do
		@url = Url.find_by_id(params[:id])

		if @url && url_belongs_to_user?
			url.update(title: params[:title])
			flash[:success] = 'Updated title!'
			redirect "/urls/#{url.id}"
		else
			redirect '/'
		end
	end

	post '/urls' do
		
		unless Url.valid_target_url?(params[:target_url])
			flash[:error] = "Unable to shorten that link. It is not a valid url."
			redirect '/'
		end
			
		if logged_in?
			url = Url.find_or_create_by(target_url: params[:target_url], user_id: session[:user_id])
		else
			url = Url.new(target_url: params[:target_url])

			url_hash = temporary_urls.detect {|url_hash| url_hash[:target_url] == params[:target_url]}

			if url_hash
				url.id = url_hash[:id]
			else
				url.save
				temporary_urls << { id: url.id, target_url: url.target_url}
			end
				
		end
		
		flash[:shortened_url] = url.shorten(host)
	
		redirect '/'
	end
	
	def url_belongs_to_user?
		temp_url = temporary_urls.detect{|url_hash| url_hash[:id] == @url.id}

		temp_url || (logged_in? && @url.user_id == session[:user_id])
	end

end