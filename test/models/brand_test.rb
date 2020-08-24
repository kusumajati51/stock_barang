require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "should not save brand without name" do
    brand = Brand.new
    assert_not brand.save
  end
end
