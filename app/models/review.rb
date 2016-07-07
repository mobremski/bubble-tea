class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 1..5
  validates :votecount, presence: true, numericality: { only_integer: true }
end
