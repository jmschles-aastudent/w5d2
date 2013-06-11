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

  validates :username, :presence => true,
                       :uniqueness => true

  validates :password_digest, :presence => true

  # has_many :friendings
  has_many :friend_circles
  # user_id     # friend_id
  # 1            2
  # 1            3
  # 1            5
  has_many :friends, :through => :friend_circles
  # user.friends

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