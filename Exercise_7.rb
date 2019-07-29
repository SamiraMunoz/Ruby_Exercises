class EmptyNumberError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidFloatError < StandardError; end

class FactorialNumber
  def initialize(number)
    @number = self.parse_number(number)
  end

  def parse_number(number)
    return if invalid_number?(number)
    number.to_i.abs
  end

  def invalid_number?(number)
    if number_empty?(number)
      raise EmptyNumberError, 'The argument is empty'
    elsif number_string?(number)
      raise InvalidStringError, 'The argunment is a String'
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

  def number_float?(number)
    number.class == Float
  end

  def factorial
    (1..@number).inject(1) { |product, num| product * num }
  end
end