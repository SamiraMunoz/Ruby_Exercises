require 'minitest/autorun'
require '../Exercise_4_Parametros.rb'

class Palindrom < Minitest::Test
  def test_multiples
    palindrome = Palindrome.new(3)
    assert_equal 906609, palindrome.digit_product
  end
  def test_multiples_parameter_string
    palindrome = Palindrome.new("Hola mundo")
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
  def test_multiples_parameter_0
    palindrome = Palindrome.new(0)
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
  def test_multiples_parameter_negative
    palindrome = Palindrome.new(-1)
    assert_raises ArgumentError do 
      palindrome.digit_product
    end
  end
end