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
        @place.save
      redirect "/lists/#{params[:list_id]}/places"
     end
    
    get '/lists/:list_id/places/:places_id/edit' do #loads edit form
        if logged_in?
        @list = List.find_by(params[:id])
        @place = current_user.places.find_by(id: params[:id])
        if @place
         erb :"places/edit"
        else
        redirect to '/'
      end
    end
 end
    patch '/lists/:list_id/places/:place_id' do #edits a place
    if logged_in?
      @list = List.find_by(params[:id])
      place = current_user.places.find_by_id(id: params[:id])
      place.update(name: params[:name], content: params[:content])
      redirect "/lists/#{params[:list_id]}/places"
        else
        redirect '/'
      end
    end

   delete '/lists/:list_id/places/:place_id' do #deletes place
    if logged_in?
    @list = List.find_by(params[:id])
    place = current_user.places.find_by(id: params[:id])
    if place
    place.delete
    redirect "/lists/#{params[:list_id]}/places"
    else
        redirect '/lists'
     end
    end
   end
    
end