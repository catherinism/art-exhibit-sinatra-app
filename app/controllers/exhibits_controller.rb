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
      redirect "/exhibits/new"
    end

  end


end
