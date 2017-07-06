class ListsController < ApplicationController
    
     get '/lists' do
        erb :'/lists/lists'
    end

    get '/lists/new' do #loads new form
    erb :'/lists/create'
   end
    
    post '/lists' do #creates a list
        @list = List.create(params)
        redirect to '/lists'
    end
    
end
