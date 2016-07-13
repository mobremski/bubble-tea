class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  has_many :votes

  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 1..5

  def votecounts
    upvotes = votes.where(upvote: true).count
    downvotes = votes.where(upvote: false).count
    upvotes - downvotes
  end
end
