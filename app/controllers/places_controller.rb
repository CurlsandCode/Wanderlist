class PlacesController < ApplicationController
    
    get '/lists/:list_id/places' do #loads all places
      @list = List.find_by_id(params[:list_id])
        @place = Place.find_by(params[:place_id])
        @places = Place.all
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
        @place = Place.find_by(params[:place_id])
         erb :"places/edit"
    end
    

    patch '/lists/:list_id/places/:place_id' do #edits a place
      @list = List.find_by(params[:list_id])
      @place = Place.find_by_id(params[:place_id])
      @place.update_attributes(params[:place])
      @place.save
    redirect "/lists/#{params[:list_id]}/places"
    end

   delete '/lists/:list_id/places/:place_id' do #deletes place
    @list = List.find_by(params[:list_id])
    @place = Place.find_by_id(params[:place_id])
    @place.destroy
    redirect "/lists/#{params[:list_id]}/places"
    end
    
end