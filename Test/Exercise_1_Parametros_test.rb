require 'minitest/autorun'
require '../Exercise_1_Parametros.rb'

class Multiples3a5 < Minitest::Test   
  def test_multiples
    multiplos_3_and_5 = Multiples3and5.new
    assert_equal 233168, multiplos_3_and_5.sum_multiples
  end
end

