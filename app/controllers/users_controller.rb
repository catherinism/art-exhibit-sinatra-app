class UsersController < ApplicationController

#render login page
  get '/login' do
    erb:login
  end

#receive the login form, find and log the user
  post '/login' do
    binding.pry
  end

#render signup page
  get 'signup' do
    erb:signup
  end
end
