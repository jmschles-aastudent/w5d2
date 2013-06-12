# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :username, :password

  validates :username,
    :presence => true,
    :uniqueness => true

  validates :password_digest,
    :presence => true

  has_many :friend_circles,
    :dependent => :destroy

  has_many :friends,
    :through => :friend_circles

  has_many :posts,
    :foreign_key => :author_id,
    :dependent => :destroy

  has_many :circle_memberships,
    :class_name => "Membership",
    :foreign_key => :friend_id

  has_many :membered_circles,
    :through => :circle_memberships,
    :source => :friend_circle

  # has_many :shared_posts, :through => :posts, :source => :post_shares

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def correct_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    new_token = SecureRandom.urlsafe_base64(32)
    while User.find_by_session_token(new_token)
      new_token = SecureRandom.urlsafe_base64(32)
    end
    self.session_token = new_token
    self.save!
  end

  def destroy_session_token!
    self.session_token = nil
    self.save!
  end
end
