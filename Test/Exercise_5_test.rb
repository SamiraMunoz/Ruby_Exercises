require 'minitest/autorun'
require '../Exercise_5.rb'

class Palindrom < Minitest::Test
  def test_multiples
    prime = Prime10001.new
    assert_equal 104743, prime.primes
  end
end