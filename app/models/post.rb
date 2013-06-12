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
  # has_many :circle_shares, :through => :post_shares, :source => :friend_circle

  accepts_nested_attributes_for :links,
    :reject_if => :all_blank
end
