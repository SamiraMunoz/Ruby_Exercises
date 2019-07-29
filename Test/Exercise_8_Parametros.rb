require 'minitest/autorun'
require '../Exercise_8_Parametros.rb'

describe DifferenceSquare do 
  it "Diference square up to 10" do
    difference = DifferenceSquare.new(10)
    difference.sum_square.must_equal(2640)
  end
  it 'when the parameter is '' ' do
    err = lambda { DifferenceSquare.new(nil) }.must_raise(EmptyNumberError)
    err.message.must_match 'The argument is empty'
  end
  it 'when the parameter is string' do
    err = lambda { DifferenceSquare.new('Hola mundo') }.must_raise(InvalidStringError)
    err.message.must_match 'The argunment is a String'
  end
  it 'when the parameter is float' do
    err = lambda { DifferenceSquare.new(2.2) }.must_raise(InvalidFloatError)
    err.message.must_match 'The argument is float'
  end
  it 'when the parameter is negative' do
    err = lambda { DifferenceSquare.new(-2) }.must_raise(InvalidNegativeError)
    err.message.must_match 'The argument is negative'
  end
  it 'when the parameter is 1' do
    err = lambda { DifferenceSquare.new(1) }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is 0 or 1'
  end
end