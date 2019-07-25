require 'minitest/autorun'
require '../Exercise_4_Parametros.rb'

class Palindrom < Minitest::Test
  # when the parameter is 3 I should expect the response to be 906609
  def test_multiples
    palindrome = Palindrome.new(3)
    assert_equal 906609, palindrome.digit_product
  end
  # when the parameter is string I should expect the response to be "The argument is not an integer greater than 1"
  def test_multiples_parameter_string
    palindrome = Palindrome.new("Hola mundo")
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
  # when the parameter is string I should expect the response to be "The argument is not an integer greater than 1"
  def test_multiples_parameter_0
    palindrome = Palindrome.new(0)
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
  # when the parameter is string I should expect the response to be "The argument is not an integer greater than 1"
  def test_multiples_parameter_negative
    palindrome = Palindrome.new(-1)
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
  # when the parameter is string I should expect the response to be "The argument is not an integer greater than 1"
  def test_multiples_parameter_1
    palindrome = Palindrome.new(1)
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
end