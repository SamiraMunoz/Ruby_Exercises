require 'minitest/autorun'
require '../Exercise_1.rb'

class DifferenceSqua < Minitest::Test   
  def test_multiples
    assert_equal 233168, sum_multiples
  end
end