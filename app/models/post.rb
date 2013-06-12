class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title, :links_attributes, :friend_circle_ids

  belongs_to :user
  has_many :links

  has_many :post_shares
  has_many :friend_circles, :through => :post_shares, :source => :friend_circle

  accepts_nested_attributes_for :links
end
