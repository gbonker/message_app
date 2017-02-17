require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test relationships
  should belong_to(:sender)
  should belong_to(:recipient)
  should have_many(:messages)

  # test validations
  should validate_uniqueness_of(:sender_id)

end
