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
  puts params
  @user = User.find_by(email: params[:email])
  puts @user
  if @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id

    redirect "/users/#{@user.id}"
  else
    redirect "/"
  end
end

post '/log_out' do
  session[:user_id] = nil

  redirect "/"
end

#dn Users INDEX
get '/users' do
  @users = User.all
end

#dn Users SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  @posts = Post.all
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
  @posts = Post.all
  erb :posts
end
