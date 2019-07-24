require 'minitest/autorun'

def largest_prime_factor(largest_factor)
  factor = 0
  2.upto(largest_factor) do |num|
    next if largest_factor % num != 0
    factor = num
    largest_factor = largest_factor/num
  end
  factor
end
class PrimeFactors < Minitest::Test
  def test_multiples
    assert_equal 29, largest_prime_factor(13195)
  end
end

