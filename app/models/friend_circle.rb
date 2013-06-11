# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class FriendCircle < ActiveRecord::Base
  attr_accessible :user_id, :name, :friend_ids

  belongs_to :user
  has_many :memberships
  has_many :friends, :through => :memberships, :source => :friend

  # has_many :friends, :through => :user, :source =>

end
