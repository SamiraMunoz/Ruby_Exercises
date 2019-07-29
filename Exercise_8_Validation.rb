class EmptyNumberError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidFloatError < StandardError; end
class InvalidNegativeError < StandardError; end
class InvalidNumberError < StandardError; end


class Validation 
  def parse_number(end_number)
    return if invalid_number?(end_number)
    end_number.to_i
  end

  def invalid_number?(end_number)
    if number_empty?(end_number)
      raise EmptyNumberError, 'The argument is empty'
    elsif number_string?(end_number)
      raise InvalidStringError, 'The argunment is a String'
    elsif number_float?(end_number)
      raise InvalidFloatError, 'The argument is float'
    elsif number_negative?(end_number)
      raise InvalidNegativeError, 'The argument is negative'
    elsif number_is_0_or_1?(end_number)
      raise InvalidNumberError, 'The argument is 0 or 1'
    end
  end

  def number_empty?(end_number)
    end_number.nil? || end_number == ''
  end

  def number_string?(end_number)
    end_number.class == String && end_number.to_i == 0
  end

  def number_float?(end_number)
    end_number.class == Float
  end

  def number_negative?(end_number)
    end_number < 0
  end

  def number_is_0_or_1?(end_number)
    end_number == 0 || end_number == 1
  end
end