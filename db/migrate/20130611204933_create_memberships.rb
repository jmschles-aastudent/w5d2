class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :friend_circle_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
