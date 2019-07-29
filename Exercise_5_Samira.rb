require_relative 'Exercise_5_Validation.rb'

class Prime
  include Validation
  
  def initialize(number)
    @number = parse_number(number)
  end

  def primes
    first_primes = [2]
    c,num,counter = 1,3,0
    while c < @number
      first_primes.each do |prime|
        counter += 1 if num % prime != 0
      end 
      if counter == first_primes.length
        first_primes << num
        c += 1
      end
      num += 1
      counter = 0
    end
    num-1
  end
end
