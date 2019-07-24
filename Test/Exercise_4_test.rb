require 'minitest/autorun'
require '../Exercise:4.rb'

class Palindrom < Minitest::Test
  def test_multiples
    palindrome = Palindrome.new
    assert_equal 906609, palindrome.three_digit_product
  end
end
