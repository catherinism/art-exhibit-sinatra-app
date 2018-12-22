class ExhibitsController < ApplicationController

#render new exhibit page
  get '/exhibits/new' do
    erb :"/exhibits/new"
  end

# receives new exhibit form
  post '/exhibits' do
    if !params[:theme].empty?
      @exhibit = Exhibit.create(params)
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

end
