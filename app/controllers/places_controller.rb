class PlacesController < ApplicationController
    
    get '/places' do
        if logged_in?#loads all places
        @places = Place.all
        erb :"/places/places"
       else
       redirect to '/login'
      end
    end
    
    get '/places/new' do #loads new form
     if logged_in?
     erb :'/places/new'
     else
     redirect to "/login"
     end
    end
    
    post '/places' do #creates a place
      place = current_user.places.build(params[:place])
       if place.save
      redirect to "/places"
       else
        erb :'/places/new'
       end
     end
    
    get '/places/:places_id/edit' do #loads edit form
        if logged_in?
        @place = current_user.places.find_by(id: params[:id])
        if @place
         erb :"places/edit"
        else
        redirect to '/'
      end
    end
 end
    patch '/places/:place_id' do #edits a place
    if logged_in?
      place = current_user.places.find_by_id(id: params[:id])
      place.update(name: params[:name], content: params[:content])
      redirect "/places"
        else
        redirect '/'
      end
    end

   get '/places/:place_id/delete' do #deletes place
    if logged_in?
    place = current_user.places.find_by(id: params[:id])
    if place
    place.delete
    redirect "/places"
    else
        redirect '/places/3{params[:id]}'
     end
    end
   end
    
end