require 'minitest/autorun'
require '../Exercise_3.rb'

class PrimeFactor < Minitest::Test
  # when the parameter is 13195 I should expect the response to be 29
  def test_multiples
    factor = PrimeFactors.new(13195)
    assert_equal 29, factor.largest_prime_factor
  end
  # when the parameter is 0 I should expect the response to be 0
  def test_multiples_parameter_0
    factor = PrimeFactors.new(0)
    assert_same 0, factor.largest_prime_factor
  end
  # when the parameter is "Hola mundo" I should expect the response to be "The argument is not integer."
  def test_multiples_parameter_string
    factor = PrimeFactors.new("Hola mundo")
    assert_raises ArgumentError do 
      factor.largest_prime_factor
    end
  end
end

