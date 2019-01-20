require 'active_record'
require 'sinatra'
require 'rake'

class User < ActiveRecord::Base
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user

end

# class Tags < ActiveRecord::Base

# end