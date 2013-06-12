# == Schema Information
#
# Table name: post_shares
#
#  id               :integer          not null, primary key
#  post_id          :integer
#  friend_circle_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class PostShare < ActiveRecord::Base
  attr_accessible :friend_circle_id, :post_id

  belongs_to :post
  belongs_to :friend_circle

  # has_many :memberships
  # has_many :friendshared_with, :through => :memberships, :source => :friend

  # has_many :friends, :through => :friend_circle, :source => :friends

  # has_many :circle_shares,
  #   :through => :friend_circle,
  #   :source =>

end
