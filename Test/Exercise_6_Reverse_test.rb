require 'minitest/autorun'
require '../Exercise_6_Reverse.rb'

class Palindrom < Minitest::Test
  # when the parameter is 'oso' I should expect the response to be true
  def test_palindrome
    equal_reading = Palindrome.new('oso')
    assert equal_reading.equal_letters?
  end
  # when the parameter is 'Pop' I should expect the response to be true
  def test_palindrome_Upcase
    equal_reading = Palindrome.new('Pop')
    assert equal_reading.equal_letters?
  end
  # when the parameter is 'sopa' I should expect the response to be false
  def test_palindrome_not
    equal_reading = Palindrome.new('sopa')
    assert_equal false, equal_reading.palindrome_word?
  end  
  # when the parameter is 2 I should expect the response to be 'The argunment is a numeric'
  def test_palindrome_parameter_integer
    err = assert_raises InvalidNumericError do
      Palindrome.new(2)
    end
    assert_match 'The argunment is a numeric', err.message
  end
  # when the parameter is '' I should expect the response to be 'The argument is empty'
  def test_palindrome_parameter_empty
    err = assert_raises EmptyWordError do
      Palindrome.new(nil)
    end
    assert_match 'The argument is empty', err.message
  end
  # when the parameter is 2.3 I should expect the response to be 'The argunment is a numeric'
  def test_palindrome_parameter_float
    err = assert_raises InvalidNumericError do
      Palindrome.new(2.3)
    end
    assert_match 'The argunment is a numeric', err.message
  end
end