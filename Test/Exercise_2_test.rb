require 'minitest/autorun'
require '../Exercise_2.rb'

class Fibonacc < Minitest::Test   
  def test_multiples
    sum_even_fibonacci = Fibonacci.new
    assert_equal 4613732, sum_even_fibonacci.sum_even
  end
end