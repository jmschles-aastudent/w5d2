# == Schema Information
#
# Table name: memberships
#
#  id               :integer          not null, primary key
#  friend_circle_id :integer
#  friend_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Membership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :friend_id

  belongs_to :friend_circle
  belongs_to :friend, :class_name => "User"
  # has_many :friends, :through => "Membership", :source => :friend

end
