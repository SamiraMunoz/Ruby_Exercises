require 'minitest/autorun'
require '../Exercise_3.rb'

class PrimeFactor < Minitest::Test
  def test_multiples
    factor = PrimeFactors.new(13195)
    assert_equal 29, factor.largest_prime_factor
  end
end

