class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps
    end
  end
end
