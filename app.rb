require 'sinatra'
require_relative 'models'

#dn enables cookies
set :sessions, true

### Global routes ###
get '/' do
  erb :index
end

### User routes ###

#dn Users INDEX
get '/users' do
  @users = User.all
end
#dn Users SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  #dn set the erb file once created
    # figure out how to set to display last 20 posts
end
#dn Users NEW
get '/users/new' do
  erb :log_in
end
#dn Users EDIT
get '/users/edit' do

end

#dn Users CREATE
post '/users' do
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
  redirect '/dashboard'
end
#dn Users UPDATE
put '/users/:id' do

end
#dn Users DESTROY
delete '/users/:id' do
  erb :log_out
end



get '/posts/:id' do
  @post = Post.find(params[:id])
  #dn set @posts = Post.all later
end



### Post routes ###

#dn Posts INDEX
get '/users/:id/posts/' do
  begin
    @user = User.find(params[:id])
    @posts = @user.posts.order(datetime: :desc).limit(20).offset(params[:page])
    # @paginate = @posts.paginate(:page => params[:page], :per_page => 20)
  rescue
    flash[:warning] = 'This user has no posts!'
    redirect '/'
  end
  erb :posts
end

#dn Posts SHOW
get '/users/:id/posts/:id' do

end
#dn Posts NEW
get "/users/:id/posts/new" do

end
#dn Posts EDIT
get '/users/:id/posts/:id/edit' do
end

#dn Posts CREATE
post '/users/:id/posts/new' do
end
#dn Posts UPDATE
put '/users/:id/posts/:id' do
end
#dn Posts DELETE
delete '/users/:id/posts/:id' do
  #DESTROY
end
