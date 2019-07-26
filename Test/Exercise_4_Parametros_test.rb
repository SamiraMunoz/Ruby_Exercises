require 'minitest/autorun'
require '../Exercise_4_Parametros.rb'

class Palindrom < Minitest::Test
  # when the parameter is 3 I should expect the response to be 906609
  def test_palindrome
    palindrome = Palindrome.new(3)
    assert_equal 906609, palindrome.digit_product
  end
  # when the parameter is "2" I should expect the response to be 9009
  def test_palindrome_parameter_string_number
    palindrome = Palindrome.new("2")
    assert_equal 9009, palindrome.digit_product
  end
  # when the parameter is "Hola mundo" I should expect the response to be "The argunment is a Strings"
  def test_palindrome_parameter_string
    palindrome = Palindrome.new("Hola mundo")
    assert_raises ArgumentError do 
      assert_equal "The argunment is a String", palindrome.digit_product
    end
  end
  # when the parameter is 0 I should expect the response to be "The argument is not an integer greater than 1"
  def test_palindrome_parameter_0
    palindrome = Palindrome.new(0)
    assert_raises ArgumentError do 
      assert_equal "The argument is not an integer greater than 1", palindrome.digit_product
    end
  end
  # when the parameter is '' I should expect the response to be "The argument is empty"
  def test_palindrome_parameter_empty
    palindrome = Palindrome.new('')
    assert_raises ArgumentError do 
      assert_equal "The argument is empty",palindrome.digit_product
    end
  end
end