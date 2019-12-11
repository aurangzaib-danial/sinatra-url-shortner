class SessionsController < ApplicationController

  get '/signup' do
    redirect '/' if logged_in?

    @title = 'Sign up'
    @user = User.new
    
    erb :'sessions/signup.html'
  end


  post '/signup' do
    
    @user = User.new(email: params[:email], password: params[:password])

    if @user.save
      session[:user_id] = @user.id

      associate_temporary_urls

      redirect '/'
    else
      erb :'sessions/signup.html'
    end
  end

  get '/login' do
    redirect '/' if logged_in?

    @title = 'Log in'

    erb :'sessions/login.html'
  end

  post '/login' do
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      associate_temporary_urls

      redirect '/'
    else
      flash[:error] = 'Invalid email or password.' 
      redirect '/login'
    end
  end

  get '/logout' do
    redirect '/' unless logged_in?
    session.clear
    redirect '/'
  end


  def associate_temporary_urls
    temporary_urls.each do |url_hash|
      url = Url.find_by_id(url_hash[:id])
      url.update(user_id: session[:user_id])
    end

    temporary_urls.clear
  end


end