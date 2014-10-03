class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  #has a descriptio
end