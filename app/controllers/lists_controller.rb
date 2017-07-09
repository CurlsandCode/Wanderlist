class ListsController < ApplicationController
    
     get '/lists' do #loads all list
         @lists = List.all
        erb :'/lists/index'
    end

end
