require 'faker'
require_relative '../app/models/topic'
require_relative '../app/models/comment'
require_relative '../app/models/user'

class Seeds
  def self.run
    5.times do
      User.create!(user_name: Faker::Internet.user_name)
    end

    5.times do
      topic = Topic.create!(title: Faker::Name.title)
      topic.user = User.all.sample
      topic.save
    end

    10.times do
      comment = Comment.create!(description: Faker::Lorem.sentence)
      comment.topic = Topic.all.sample
      comment.user = User.all.sample
      comment.save
    end
  end
end

Seeds.run