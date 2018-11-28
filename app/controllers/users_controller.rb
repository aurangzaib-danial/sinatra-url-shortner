class UsersController < ApplicationController

	get '/signup' do
    if !logged_in?
      @user = User.new
      erb :signup
    else
      redirect '/'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :signup
    end
  end

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect '/'
    end
  end

  post '/login' do
   user = User.find_by_username(params[:username])
   if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
   else
    flash[:error] = "Invalid Credentials!"
    redirect '/login'
   end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect '/'
  end

end