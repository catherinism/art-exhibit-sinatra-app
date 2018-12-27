class ExhibitsController < ApplicationController

#render new exhibit page
  get '/exhibits/new' do
    erb :"/exhibits/new"
  end

# receives new exhibit form
  post '/exhibits' do
    if !logged_in?
      redirect "/login"
    end
    if !params[:title].empty? && !params[:deadline].empty?
      @exhibit = Exhibit.create(params) #mass assignmnet? user_id?
      redirect "/exhibits/#{@exhibit.id}"
    else
      #"Please enter your exhibit"
      redirect "/exhibits/new"
    end
  end

  get '/exhibits/:id' do
    @exhibit = Exhibit.find_by(id: params[:id])
    erb :"/exhibits/show"
  end

  get '/exhibits/:id/edit' do
    erb :"/exhibits/edit"
  end

end
