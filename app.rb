require 'sinatra'
require 'sinatra/flash'
require_relative 'models'

#dn enables cookies
set :sessions, true

# def current_user
#   @user ||= User.find(session[:user_id])
# end

### Global routes ###
get '/' do
  
  erb :index #, locals: { current_user: current_user }
end

### User routes ###
post '/sign_up' do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    # full_name: params[:first_name][:last_name],
    password_hash: params[:password_hash],
    email: params[:email],
    dob: params[:dob]
  )
  @user.save
  session[:user_id] = @user.id

  redirect "/"
end

post '/log_in' do
  puts params
  @user = User.find_by(email: params[:email])
  puts @user
  if @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id

    redirect "/users/#{@user.id}'"
  else
    redirect "/"
  end
end

#dn Users INDEX
get '/users' do
  @users = User.all
end

#dn Users SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_show
end

#dn Posts SHOW
# get '/users/:id/posts' do
#   @user = User.find(params[:id])
#   @posts = @user.posts.order(datetime: :desc).limit(20)
# end

get '/new_post' do
  erb :new_post
end

get '/posts/:id' do
  @user = User.find_by(user_id: params[:user_id])
  @posts = Post.find_by()
  erb :posts
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

post '/post' do
  # @user = User.find_by(email: params[:email])
  @post = Post.create(
    title: params[:title],
    content: params[:content],
    user_id: current_user.id,
    datetime: Time.now.utc
  )
  post.save

  redirect "/dashboard" #"/users/#{@user.id}"
end


