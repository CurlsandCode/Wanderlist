class ListsController < ApplicationController
    
     get '/lists' do #loads all list
         @list =List.all
        erb :'/lists'
    end

    get '/lists/new' do #loads new form
    erb :'/lists/create'
   end
    
    post '/lists' do #creates a list
        @list = List.create(params)
        redirect to '/lists'
    end
    
    get '/lists/:id/edit' do #loads edit form
        @list = List.find(params[:id])
        erb :edit
    end
    
    patch '/lists/:id' do #updates list
        @list = List.find(params[:id])
        @list.name = params[:name]
        @list.reason = params[:reason]
        erb :show
    end
    
    delete '/lists/:id/delete' do #deletes a list
        @list =List.find(param[:id])
        @list.delelte
        redirect '/lists'
    end
    
end
