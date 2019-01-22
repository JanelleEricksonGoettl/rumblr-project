require 'sinatra/activerecord'
require 'pg'

### Environments ###
#dn local machine
configure :development do
  #dn sets the directory to this project file 'rumblr'
  set :database, 'postgresql:rumblr'
end

#dn on heroku
configure :production do
  #dn sets the directory to an Env variable on heroku via 'settings'
  set :database, ENV['DATABASE_URL']
end

### 
class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
end

class Post < ActiveRecord::Base
  belongs_to :user
end