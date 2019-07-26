require 'minitest/autorun'
require '../Exercise_5_Samira.rb'

class Prim < Minitest::Test
  # when the parameter is 10 I should expect the response to be 29
  def test_prime
    prime = Prime.new(10)
    assert_equal 29, prime.primes
  end

  # when the parameter is '100' I should expect the response to be 9009
  def test_prime_parameter_string_number
    prime = Prime.new('100')
    assert_equal 541, prime.primes
  end

  # when the parameter is 0 I should expect the response to be 'The argument is not an integer greater than 1'
  def test_prime_parameter_0
    err = assert_raises NumberNegativeError do
      Prime.new(-4)
    end
    assert_match 'The argument is not an integer negative', err.message
  end

  # when the parameter is 'Hola mundo' I should expect the response to be 'The argunment is a Strings'
  def test_prime_parameter_string
    err = assert_raises InvalidStringError do
      Prime.new('Hola mundo')
    end
    assert_match 'The argunment is a String', err.message
  end

  # when the parameter is '' I should expect the response to be 'The argument is empty'
  def test_prime_parameter_empty
    err = assert_raises EmptyNumberError do
      Prime.new('')
    end
    assert_match 'The argument is empty', err.message
  end

  # when the parameter is 7.4 I should expect the response to be 'The argument is float'
  def test_prime_parameter_float
    err = assert_raises InvalidFloatError do
      Prime.new(7.4)
    end
    assert_match 'The argument is float', err.message
  end  
end