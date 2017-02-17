require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test relationships
  should belong_to(:conversation)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:body)
  should validate_presence_of(:conversation_id)
  should validate_presence_of(:user_id)

end
