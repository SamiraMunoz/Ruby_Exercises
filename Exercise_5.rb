require 'prime'
require_relative 'Exercise_5_Validation.rb'

class PrimeNumber 
  include Validation
  
  def initialize(number)
    @number = parse_number(number)
  end

  def primes
    prime = Prime.first @number
    prime.max
  end
end