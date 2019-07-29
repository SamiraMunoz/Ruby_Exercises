require 'prime'
require_relative 'Exercise_5_Validation.rb'

class EmptyNumberError < StandardError; end
class InvalidStringError < StandardError; end
class NumberNegativeError < StandardError; end
class InvalidFloatError < StandardError; end

class PrimeNumber < Validation
  def initialize(number)
    @number = self.parse_number(number)
  end

  def primes
    prime = Prime.first @number
    prime.max
  end
end