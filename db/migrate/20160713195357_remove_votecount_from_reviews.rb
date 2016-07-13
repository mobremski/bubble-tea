class RemoveVotecountFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :votecount, :integer
  end
end
