class Topic < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments
  belongs_to :user

  def count_vote
    vote
  end
  def return_comments(id)
    Comment.all.find_by(topic_id: id)
  end
end


