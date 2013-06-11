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

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
