class PlacesController < ApplicationController
    
    get '/places/new' do #loads new form
    erb :'/places/create'
   end
    
    post '/places' do #creates a place
        @list = List.create(params)
        redirect to '/places'
    end
    
    get '/places/:id/edit' do #loads edit form
        @list = List.find(params[:id])
        erb :edit
    end
    
    patch '/places/:id' do #updates a place
        @list = List.find(params[:id])
        @list.name = params[:name]
        @list.reason = params[:reason]
        erb :show
    end
    
    delete '/places/:id/delete' do #deletes a place
        @list =List.find(param[:id])
        @list.delelte
        redirect '/places'
    end
    
end