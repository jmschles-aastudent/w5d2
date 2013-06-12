# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :string(255)
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title, :links_attributes, :friend_circle_ids

  belongs_to :user

  has_many :links,
    :dependent => :destroy

  has_many :post_shares,
    :dependent => :destroy

  has_many :friend_circles,
    :through => :post_shares,
    :source => :friend_circle

  has_many :shared_with,
    :through => :friend_circles,
    :source => :friends

  # has_many :circle_shares, :through => :post_shares, :source => :friend_circle

  accepts_nested_attributes_for :links,
    :reject_if => :all_blank
end

# circles = current_user.circle_memberships
# circles.posts_shared_with
# Post where post.shared_with includes current_user