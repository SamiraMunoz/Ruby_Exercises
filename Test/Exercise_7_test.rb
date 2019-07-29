require 'minitest/autorun'
require '../Exercise_7.rb'

class Factoria < Minitest::Test
  # when the parameter is 4 I should expect the response to be 24
  def test_factorial
    factorial_num = FactorialNumber.new(4)
    assert_equal 24, factorial_num.factorial
  end

  # when the parameter is '4' I should expect the response to be 24
  def test_factorial_parameter_string_number
    factorial_num = FactorialNumber.new('4')
    assert_equal 24, factorial_num.factorial
  end

   # when the parameter is -4 I should expect the response to be 24
  def test_factorial_parameter_negative_number
    factorial_num = FactorialNumber.new(-4)
    assert_equal 24, factorial_num.factorial
  end

  # when the parameter is -4 I should expect the response to be 24
  def test_factorial_parameter_0
    factorial_num = FactorialNumber.new(0)
    assert_equal 1, factorial_num.factorial
  end

  # when the parameter is 'Hola mundo' I should expect the response to be 'The argunment is a Strings'
  def test_factorial_parameter_string
    err = assert_raises InvalidStringError do
      FactorialNumber.new('Hola mundo')
    end
    assert_match 'The argunment is a String', err.message
  end

  # when the parameter is '' I should expect the response to be 'The argument is empty'
  def test_factorial_parameter_empty
    err = assert_raises EmptyNumberError do
      FactorialNumber.new(nil)
    end
    assert_match 'The argument is empty', err.message
  end

  # when the parameter is 7.4 I should expect the response to be 'The argument is float'
  def test_factorial_parameter_float
    err = assert_raises InvalidFloatError do
      FactorialNumber.new(7.4)
    end
    assert_match 'The argument is float', err.message
  end  
end