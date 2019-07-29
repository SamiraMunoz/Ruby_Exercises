require 'minitest/autorun'
require '../Exercise_8_Parametros.rb'

describe DifferenceSquare do 
  it "Diference square up to 10" do
    difference = DifferenceSquare.new
    difference.sum_square.must_equal(25164150)
  end
end