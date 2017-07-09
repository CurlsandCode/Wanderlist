class ListsController < ApplicationController
    
     get '/lists' do #loads all list
         @list =List.all
        erb :'/lists/index'
    end

end
