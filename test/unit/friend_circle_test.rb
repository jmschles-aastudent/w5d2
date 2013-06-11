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

require 'test_helper'

class FriendCircleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
