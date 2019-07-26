class EmptyNumberError < StandardError; end
class InvalidStringError < StandardError; end
class NumberNegativeError < StandardError; end
class InvalidFloatError < StandardError; end

class Prime
  def initialize(number)
    @number = self.parse_number(number)
  end

  def parse_number(number)
    return if invalid_number?(number)
    number.to_i
  end

  def invalid_number?(number)
    if number_empty?(number)
      raise EmptyNumberError, 'The argument is empty'
    elsif number_string?(number)
      raise InvalidStringError, 'The argunment is a String'
    elsif number_number_negative?(number)
      raise NumberNegativeError, 'The argument is not an integer negative'
    elsif number_float?(number)
      raise InvalidFloatError, 'The argument is float'
    end
  end

  def number_empty?(number)
    number.nil? || number == ''
  end

  def number_string?(number)
    number.class == String && number.to_i == 0
  end

  def number_number_negative?(number)
    number.to_i < 0
  end

  def number_float?(number)
    number.class == Float
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
