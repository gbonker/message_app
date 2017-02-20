require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test relationships
  should have_many(:user_conversations)
  should have_many(:users).through(:user_conversations)
  should have_many(:messages)

end
