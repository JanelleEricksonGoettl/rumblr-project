require 'sinatra/activerecord'
require 'pg'

set :database, 'postgresql:rumblr'

# enable :sessions

### Environments ###
# configure :development do
#   set :database, ###
# end

# configure :production do
#   set :database, ### ENV["DATABASE_URL"]
# end

# ### 
# class User < ActiveRecord::Base
#   has_many :posts
# end

# class Post < ActiveRecord::Base
#   belongs_to :user

# end