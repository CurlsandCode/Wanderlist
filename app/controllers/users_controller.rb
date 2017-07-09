class UsersController < ApplicationController

    
    get '/login' do
      if logged_in?
    redirect to '/lists'
     else
    erb :'/users/login'
    end
    end
    
    post '/login' do
    @user = User.find(:username => params[:username])
     if @user && user.authenticate(params[:password])
    session[:id] = @user.id
     redirect '/lists'
    else
     redirect to '/login'    
    end
    end
    
    get '/signup' do
     if !logged_in?
    erb :'/users/create'
     else
     redirect to '/lists'
    end
    end
    
    post '/signup' do
    redirect to '/' if logged_in?
    @user = User.new(params)
    if @user.save
        redirect '/lists'
     else
        redirect to '/users/create'
    end
    end
    
    get '/logout' do
    session.clear
    redirect to '/login'
    end
end