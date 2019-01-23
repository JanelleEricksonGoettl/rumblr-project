require 'sinatra'
require_relative 'models'

#dn enables cookies
set :sessions, true

### Global routes ###
get "/" do
  erb :index
end

#dn display user's last 20 posts based on user_id
get "/users/:id" do
  @user = User.find(params["id"])
  #dn set the erb file once created
    # figure out how to set to display last 20 posts
end

get "/posts/:id" do
  @post = Post.find(params["id"])
  #dn set @posts = Post.all later
end

### User routes ###

# get "/sign_up" do
#   erb :dashboard
# end
post "/sign_up" do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    password: params[:password],
    email: params[:email],
    dob: params[:dob]
  )
  @user.save
  session[:user_id] = @user.id
  # figure out a flash message for successful post
  redirect "/dashboard"
end

### Post routes ###

get "/new_post" do
  erb :new_post
end

post "/new_post" do
  @new_post = Post.create(
    post_title: params[:post_title],
    post_content: params[:post_content]
  )
  @new_post.save
  redirect "/posts/#{@new_post.id}"
end


#dn logout TEST THIS
post "/log_out" do
  session['user_id'] = nil
  puts session
  redirect "/"
end