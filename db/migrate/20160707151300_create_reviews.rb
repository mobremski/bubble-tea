class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.integer :rating, null: false
      t.text :comment
      t.integer :votecount, null: false, default: 0
    end
  end
end
