require 'minitest/autorun'
require '../Exercise_5_Samira.rb'

describe Prime do 
  it 'when the parameter is 10' do
    prime = Prime.new(10)
    prime.primes.must_equal(29)
  end
  it 'when the parameter is string number' do
    prime = Prime.new('10')
    prime.primes.must_equal(29)
  end
  it 'when the parameter is negative number' do
    err = lambda { Prime.new(-2) }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is a integer negative or less than 2'
  end
  it 'when the parameter is '' ' do
    err = lambda { Prime.new('') }.must_raise(EmptyNumberError)
    err.message.must_match 'The argument is empty'
  end
  it 'when the parameter is string' do
    err = lambda { Prime.new('Hola mundo') }.must_raise(InvalidStringError)
    err.message.must_match 'The argunment is a String'
  end
  it 'when the parameter is float' do
    err = lambda { Prime.new(7.4) }.must_raise(InvalidFloatError)
    err.message.must_match 'The argument is float'
  end
end