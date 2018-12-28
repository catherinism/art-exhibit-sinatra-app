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
    @exhibit = Exhibit.find_by(id: params[:id])
    erb :"/exhibits/edit"
  end

  patch '/exhibits/:id' do
    @exhibit = Exhibit.find_by(id: params[:id])
    @exhibit.update(
    title: params[:title],
    deadline: params[:deadline],
    medium: params[:medium],
    exhibit_date: params[:exhibit_date],
    location: params[:location],
    entry_fee: params[:entry_fee])

    redirect "/exhibits/#{@exhibit.id}"
  end

end
