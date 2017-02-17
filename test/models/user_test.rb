require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test validations
  #should validate_confirmation_of(:password)
  should validate_presence_of(:password)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)

  should allow_value("Gale").for(:first_name)
  should allow_value("gbonks wunk").for(:first_name)
  should allow_value("Gale Virginia Bonker").for(:first_name)
  should_not allow_value(nil).for(:first_name)

  should allow_value("Gale").for(:last_name)
  should allow_value("gbonks wunk").for(:last_name)
  should allow_value("Gale Virginia Bonker").for(:last_name)
  should_not allow_value(nil).for(:last_name)

  should allow_value("patient").for(:role)
  should allow_value("care_manager").for(:role)
  should_not allow_value("foo").for(:role)
  should_not allow_value(5).for(:role)
  should_not allow_value(3.14).for(:role)
  should_not allow_value(nil).for(:role)

  should allow_value("gbonker@gmail.com").for(:email)
  should allow_value("gbonker@andrew.cmu.edu").for(:email)
  should allow_value("gbonker@example.com").for(:email)
  should_not allow_value("bad").for(:email)
  should_not allow_value("bad@").for(:email)
  should_not allow_value("bad@example").for(:email)
  should_not allow_value("@bad@example").for(:email)
  should_not allow_value("@bad@example.com").for(:email)
  should_not allow_value(nil).for(:email)
end
