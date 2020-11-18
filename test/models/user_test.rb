require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user' do
    user = User.new
    assert_not user.save, 'Empty Form You Idiot'
  end
end
