require 'faker'
require_relative '../app/models/topic'
require_relative '../app/models/comment'
require_relative '../app/models/user'

# class Seeds
#   def self.run
#     5.times do
#       User.create!(user_name: Faker::Internet.user_name)
#     end

#     5.times do
#       topic = Topic.create!(title: Faker::Name.title)
#       topic.user = User.all.sample
#       topic.save
#     end

#     10.times do
#       comment = Comment.create!(description: Faker::Lorem.sentence)
#       comment.topic = Topic.all.sample
#       comment.user = User.all.sample
#       comment.save
#     end
#   end
# end

class OurData
  def self.run
    User.create!(user_name: "cghilarducci")
    User.create!(user_name: "john1214")
    User.create!(user_name: "jupamedig")
    User.create!(user_name: "alberto")
    Topic.create!(title: "Validators", user_id: 1)
    Topic.create!(title: "MVP", user_id: 2)
    Topic.create!(title: "ActiveRecord Requiring Files", user_id: 3)
    Topic.create!(title: "Rspec Testing for Dummies", user_id: 4)
    Comment.create!(description: "You guys are awesome! I love you all!", topic_id: 2, user_id: 3)
    Comment.create!(description: "I love cookies... Because cookies are awesome", topic_id: 1, user_id: 1)
  end
end

OurData.run

# Seeds.run