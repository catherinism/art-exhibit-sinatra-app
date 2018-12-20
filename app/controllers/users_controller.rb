class UsersController < ApplicationController

#render login page
  get '/login' do
    erb:login
  end

#render signup page
  get 'signup' do
    erb:signup
  end
end
