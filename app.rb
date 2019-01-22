require 'sinatra'
require_relative 'models'

#dn enables cookies
set :sessions, true

### Global routes ###
get "/" do
  erb :index
end


### User routes ###
#dn get routes


#dn post routes
post "sign_up" do
  user = User.create(
    username: params[:username],
    password: params[:password]
  )
end
### Post routes ###

