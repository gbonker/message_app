require 'test_helper'

class UserConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:conversation)
  should belong_to(:user)
end
