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
    end
  end

#render signup page
  get 'signup' do
    erb:signup
  end

#render show page
  get '/users/:id' do
    "test"
  end

end
