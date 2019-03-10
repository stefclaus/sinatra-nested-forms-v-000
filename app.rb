require './environment'
require_relative "models/ship.rb"
require_relative "models/pirate.rb"


module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end


     get '/new' do
       erb :"pirates/new"
     end


    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ship.all
      erb :"pirates/show"
    end


  end
end
