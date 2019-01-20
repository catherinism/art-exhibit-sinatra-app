class UsersController < ApplicationController

#render login page
  get '/login' do
    erb:login
  end

#receive the login form, find, authenticate, log the user and redirect to the user page
  post '/login' do
    #binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      #error message
      #redirect to log in page
      flash[:message] = "The information you provided does not match our records. Please re-enter your login information or signup."
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
    @user = User.new(params)
    if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    flash[:message] = "#{@user.errors.full_messages.to_sentence}"
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
