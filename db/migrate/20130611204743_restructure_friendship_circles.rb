class RestructureFriendshipCircles < ActiveRecord::Migration
  def change
    remove_column :friend_circles, :friend_id
    add_column :friend_circles, :name, :string
  end
end
