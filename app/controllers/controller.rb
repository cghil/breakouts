require 'pry'
require_relative '../models/user'
# class Controller
#   def self.run!
#     @controller = Controller.new
#   end
#   def user_input
#      @input = gets.chomp
#   end
#   def command
#     @first_word = @input.split(" ").shift
#   end
#   def logic
#     if @controller.command ==
#   end

# end

# Controller.run!
module Controller
  def self.entry
    View.please
  end

  def self.run!
    if ARGV.length == 0
      View.help
    else
    @username = ARGV[0]
    @command = ARGV[1]
    @input = ARGV[2..-1].join(" ")
    @last_input = ARGV.last
    case
      when @command == "create"
        user = User.find_by(:user_name => @username)
        user.add_topic(@input)
        View.topic_added
      when @command == "comment"
        user = User.find_by(:user_name => @username)
        user.add_comment(@input, @last_input.to_i)
        View.add_comment
      when @command == "vote"
        user = User.find_by(:user_name => @username)
        user.vote!(@last_input)
        View.vote
      when @command == "help"
        View.help
    end
  end
  end
end

module View
  def self.please
    puts "Please enter a username and command for me!"
  end
  def self.topic_added
    puts "topic has been added!"
  end
  def self.add_comment
    puts "comment has been added"
  end
  def self.vote
    puts "You have voted!"
  end
  def self.help
    puts "To create a topic -- Enter: <username> create <topic>"
    puts "To create a comment -- Enter: <username> comment <description> <topic_id>"
    puts "To view all -- Enter: view"
    puts "To vote on a topic -- Enter: <username> vote <topic_id>"
  end

end











