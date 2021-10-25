require_relative "gossip"

class ApplicationController < Sinatra::Base

  # index - Page inicial
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # pour aller à la page de formulaire (pour creer un nouveau gossip)
  get '/gossips/new/' do
    erb :new_gossip
  end

  # pour enregistrer le formulaire
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  # pour identifier l'ID du gossip --> URL dynamique
  get '/gossips/:id' do
    erb :show, locals: {gossips: Gossip.find(params['id']), id: params['id'] }
  end

end