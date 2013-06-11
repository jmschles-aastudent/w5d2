# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FriendCircle < ActiveRecord::Base
  attr_accessible :user_id, :friend_id

  belongs_to :user
  belongs_to :friend,
    :class_name => "User",
    :foreign_key => :friend_id

  # has_many :friends, :through => :user, :source =>

end
