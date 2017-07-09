class PlacesController < ApplicationController
    
    get '/lists/:list_id/places' do
      @list = List.find(params[:list_id])
      @all_places = @list.places
      erb :"/places/places"
    end
    
    get '/lists/:list_id/places/new' do #loads new form
    erb :'/places/create_places'
   end
    
    post '/lists/:list_id/places' do #creates a place
        @place = Place.create(params[:place])
        @place.list = @list
        @place.save
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