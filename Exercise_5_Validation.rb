class EmptyNumberError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidNumberError < StandardError; end
class InvalidFloatError < StandardError; end

module Validation
  def parse_number(number)
    return if invalid_number?(number)
    number.to_i
  end

  def invalid_number?(number)
    if number_empty?(number)
      raise EmptyNumberError, 'The argument is empty'
    elsif number_string?(number)
      raise InvalidStringError, 'The argunment is a String'
    elsif number_negative_or_less_than_2?(number)
      raise InvalidNumberError, 'The argument is a integer negative or less than 2'
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

  def number_negative_or_less_than_2?(number)
    number.to_i < 2
  end

  def number_float?(number)
    number.class == Float
  end
end