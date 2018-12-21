class ExhibitsController < ApplicationController

  get '/exhibits/new' do
    erb "/exhibits/new"
  end

end
