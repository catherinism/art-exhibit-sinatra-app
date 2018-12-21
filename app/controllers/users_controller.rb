class UsersController < ApplicationController

#render login page
  get '/login' do
    erb:login
  end

#receive the login form, find, authenticate, log the user and redirect to the user page
  post '/login' do
    #binding.pry
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      #error message
      #redirect to log in page
      redirect "/login"
    end
  end

#render signup page
  get '/signup' do
    #raise params.inspect
    erb:signup
  end

#receive signup page, create user, and persist in the database
  post '/users' do
    #binding.pry
    if !params[:name].empty? || !params[:username].empty? || !params[:password].empty?
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect "/signup"
  end
end

#render show page
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end
