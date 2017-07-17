class PlacesController < ApplicationController
    
    get '/places' do #loads all places
        if logged_in?
        @places = Place.all
        erb :"/places/places"
       else
       flash[:notice] = 'Please log in first.' 
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
      place = current_user.places.create(params[:place])
       if place.save
      redirect to "/places"
       else
      flash[:notice] = place.errors.full_messages.uniq.join(',')
        erb :'/places/new'
       end
    end
    
    get '/places/:id/edit' do #loads edit form
        if logged_in?
        @place = current_user.places.find_by(id: params[:id])
        if @place
         erb :"places/edit"
        else
        flash[:notice] = 'You can only edit your places!' 
        redirect to '/places'
      end
    end
 end
    patch '/places/:id' do #edits a place
      if params.value?('')
      flash[:notice] = 'Please make sure all fields are filled-in.'   
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
        flash[:notice] = 'You can only delete your places!'
        redirect '/places'
     end
    end
   end
    
end