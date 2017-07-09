class PlacesController < ApplicationController
    
    get '/lists/:list_id/places' do #loads all places
      @list = List.find(params[:list_id])
      @places = @list.places
      erb :"/places/places"
    end
    
    get '/lists/:list_id/places/new' do #loads new form
        @list = List.find(params[:list_id])
        erb :'/places/new'
      end
    
    post '/lists/:list_id/places' do #creates a place
        @list = List.find(params[:list_id])
        @place = Place.create(params[:place])
        @place.list = @list
        @place.save
      redirect "/lists/#{params[:list_id]}/places"
    end
    
    get '/lists/:list_id/places/:places_id/edit' do #loads edit form
        @list = List.find(params[:list_id])
        @place = Place.find_by(params[:id])
         erb :"places/edit"
    end
    

    patch '/lists/:list_id/places/:id' do #edits a place
      @list = List.find(params[:list_id])
      @place = Place.find_by(params[:id])
      @place.name = params[:name]
      @place.content = params[:content]
      @place.list_id = params[:list]
      @place.save
    redirect "/lists/#{params[:list_id]}/places"
    end

   delete '/lists/:list_id/places/:place_id' do #deletes place
    @list = List.find(params[:list_id])
    @place = Place.find_by(params[:id])
    @place.destroy
    redirect "/lists/#{params[:list_id]}/places"
    end
    
end