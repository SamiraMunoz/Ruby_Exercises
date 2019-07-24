require 'minitest/autorun'

def sum_multiples(end_number)
  (1...end_number).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
end
class DifferenceSqua < Minitest::Test   
  def test_multiples
    assert_equal 233168, sum_multiples(1000)
  end
end

