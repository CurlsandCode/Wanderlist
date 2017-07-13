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
    
    get '/places/:id/edit' do #loads edit form
        if logged_in?
        @place = current_user.places.find_by(id: params[:id])
        if @place
         erb :"places/edit"
        else
        redirect to '/places'
      end
    end
 end
    patch '/places/:id' do #edits a place
      if params.value?('')
      redirect to "/places/#{@place.id}/edit"  
      else
      @place = Place.find_by_id(params[:id])
      @place.name = params[:name]
      @place.content = params[:content]
      @place.user_ids = current_user.id
      @place.save
      redirect "/places"
        
      end
    end

   get '/places/:id/delete' do #deletes place
    if logged_in?
    place = current_user.places.find_by(id: params[:id])
    if place
    place.delete
    redirect "/places"
    else
        redirect '/places'
     end
    end
   end
    
end