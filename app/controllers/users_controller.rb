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
      puts session
      redirect "users/#{@user.id}"
    else
      #error message
      #redirect to log in page
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
    if !params.empty?
    @user = User.create(params)
    redirect "/users/#{@user.id}"
  else
    redirect "/signup"
  end
end

#render show page
  get '/users/:id' do
    "test"
  end

end
