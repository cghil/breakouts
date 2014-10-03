# require 'pry'
class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  has_many :topics
  has_many :comments
  #can vote
  def vote!(id)
    topic = Topic.find(id)
    topic.increment(:vote, by = 1)
    topic.save
  end
# binding.pry
  #can add topics
  def add_topic(description)
    topic = Topic.new
    topic.title = description
    topic.user = self
    topic.save
  end
  #can delete topics there own topics; if a topic gets deleted you
  #can add comments
  def add_comment(user_comment, topic_id)
    comment = Comment.new
    comment.description = user_comment
    comment.user = self
    comment.topic = Topic.find(topic_id)
    comment.save
  end
  # def view!
  #   topics = Topic.all
  #   comments = Comment.all
  #   puts "   TOPIC ID   | #{" " * 9} TOPIC #{" " * 9} | VOTE COUNT"
  #   topics.each do |topic|
  #     puts "#{" " * 5} #{topic.id}  #{" " * 5}| #{topic.title} | #{topic.vote}"
  #   end
  #   puts " "
  #   puts "COMMENTS                                  |  USERNAME"
  #   comments.each do |comment|
  #     user = User.find_by(:id => comment.user_id)
  #     puts "#{comment.description}  |  #{user.user_name}"
  #   end
  # end
  def view!
    topics = Topic.all
    comments = Comment.all
    puts " "*80
    puts " TOPIC ID".ljust(15, " ") + "|  TOPIC".ljust(50, " ") + "|  VOTE COUNT"
    puts "-"*80
    topics.each do |topic|
      puts " #{topic.id}".ljust(15, " ") + "|  #{topic.title}".ljust(50, " ") + "|  #{topic.vote}"
    end
    puts " "
    puts " COMMENTS".ljust(50, " ") + "|  USERNAME"
    puts "-"*65
    comments.each do |comment|
      user = User.find_by(:id => comment.user_id)
      puts "#{comment.description}".ljust(50, " ") + "|  #{user.user_name}"
    end
  end
end