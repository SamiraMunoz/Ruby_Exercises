class EmptyDigitError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidIntegerError < StandardError; end

class Palindrome
  def initialize(digit)
    @digits = self.parse_digits(digit)
  end

  def parse_digits(digit)
    return if invalid_digit?(digit)
    digit.to_i
  end

  def invalid_digit?(digit)
    if digit_empty?(digit)
      raise EmptyDigitError, 'The argument is empty'
    elsif digit_string?(digit)
      raise InvalidStringError, 'The argunment is a String'
    elsif digit_less_than_1?(digit)
      raise InvalidIntegerError, 'The argument is not an integer greater than 1'
    end
  end

  def digit_empty?(digit)
    digit.nil? || digit == ''
  end

  def digit_string?(digit)
    digit.class == String && digit.to_i == 0
  end

  def digit_less_than_1?(digit)
    digit.to_i < 1
  end

  def start_digits
    ("#{7}#{'0'*(@digits-1)}").to_i
  end

  def end_digits
    ("#{9}#{'9'*(@digits-1)}").to_i
  end

  def digit_product
    mayor = 0
    start_digits.upto(end_digits) do |x|
    x.upto(end_digits) do |y|
      num = (x * y).to_s
        next if num != num.reverse
        num = num.to_i
        mayor = num if mayor < num
      end
    end
    mayor
  end
end