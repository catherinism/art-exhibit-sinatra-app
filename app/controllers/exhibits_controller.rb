class ExhibitsController < ApplicationController


  get '/exhibits' do
    @exhibits = Exhibit.all
    erb :"/exhibits/exhibits"
  end


  get '/exhibits/new' do
    erb :"/exhibits/new"
  end


  post '/exhibits' do
    if !logged_in?
      redirect "/login"
    end
    if !params[:title].empty? && !params[:deadline].empty? && !params[:medium].empty? && !params[:exhibit_date].empty? && !params[:location].empty? && !params[:entry_fee].empty?
      @exhibit = Exhibit.create(title: params[:title], deadline: params[:deadline], medium: params[:medium], exhibit_date: params[:exhibit_date], location: params[:location], entry_fee: params[:entry_fee], user_id: current_user.id) #mass assignmnet? user_id?
      redirect "/exhibits/#{@exhibit.id}"
    else
      flash[:message] = "Please don't leave any field blank."
      redirect "/exhibits/new"
    end
  end

  get '/exhibits/:id' do
    @exhibit = Exhibit.find_by(id: params[:id])
    erb :"/exhibits/show"
  end

  get '/exhibits/:id/edit' do
    @exhibit = Exhibit.find_by(id: params[:id])
    if logged_in? && @exhibit.user == current_user
      erb :"/exhibits/edit"
    else
      redirect "/"
    end
  end

  patch '/exhibits/:id' do
    @exhibit = Exhibit.find_by(id: params[:id])
    if logged_in? && @exhibit.user == current_user
    @exhibit.update(
    title: params[:title],
    deadline: params[:deadline],
    medium: params[:medium],
    exhibit_date: params[:exhibit_date],
    location: params[:location],
    entry_fee: params[:entry_fee])

    redirect "/exhibits/#{@exhibit.id}"

  else
    redirect "/"
  end
end

  delete '/exhibits/:id' do
    @exhibit = Exhibit.find_by(id: params[:id])
    if logged_in? && @exhibit.user == current_user
      @exhibit.delete
      redirect '/exhibits'
    else
      redirect "/"
    end
  end

end
