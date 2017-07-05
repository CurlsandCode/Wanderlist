require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end
    
    get '/login' do
       
    erb :'/users/login'
    end
    
    post 'login' do
    user= User.find(username: params[:username])
        redirect '/lists'
    end
    
    get '/signup' do
    erb :'/users/create'
    end
    
    post 'signup' do
        user = User.new(params)
        user.save
        redirect '/lists'
    end
    
    get '/lists' do
        erb :'/lists/lists'
    end

end
