class ListsController < Application Controller
    
     get '/lists' do
        erb :'/lists/lists'
    end

    get '/lists/new' do
    erb :'/lists/create'
   end
end
