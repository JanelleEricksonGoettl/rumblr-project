require 'sinatra'
require 'sinatra/flash'
require_relative 'models'

#dn enables cookies
set :sessions, true

### Global routes ###
get '/' do
  erb :index
end

### User routes ###
post '/sign_up' do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    password_hash: params[:password_hash],
    email: params[:email],
    dob: params[:dob]
  )
  @user.save
  session[:user_id] = @user.id

  redirect "/users/#{@user.id}"
end

post '/log_in' do
  @user = User.find_by(email: params[:email])
  if @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id

    redirect "/users/#{@user.id}"
  else
    params[:password_hash] == false || nil

    redirect "/"
  end
end

post '/log_out' do
  session[:user_id] = nil

  redirect "/"
end

get '/profile' do
  @user = User.find(session[:user_id])
  erb :profile
end

post '/delete' do
  @user = User.find(session[:user_id])
  @user.destroy

  redirect "/"
end

#dn Users INDEX
get '/users' do
  @users = User.all
  @post = Post.last
  erb :users
end

#dn Users SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  @posts = Post.all.limit(20).reverse
  erb :user_show
end

post '/new_post' do
  @user = User.find(session[:user_id])
  @post = Post.create(
    title: params[:title],
    content: params[:content],
    user_id: session[:user_id]
  )
  @post.save

  redirect "/users/#{@user.id}"
end

get '/new_post' do
  erb :new_post
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :posts
end

get '/posts' do
  @posts = Post.all.limit(20).reverse
  erb :posts
end
