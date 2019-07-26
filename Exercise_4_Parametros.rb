class Palindrome
  def initialize(digit)
    self.parse_digits(digit)
  end
  def parse_digits(digit)
    begin
      @digits = digit.to_i 
    rescue digit.class == String
      msg = "The argunment is a String"
      raise ArgumentError, msg, caller 
      return msg
    rescue digit < 1
      msg = "The argument is not an integer greater than 1"
      raise ArgumentError, msg , caller 
      return msg
    rescue digit.nil?
      msg = "The argument is empty"
      raise ArgumentError, msg , caller
      return msg
    end
  end
  def start_digits
    ("#{7}#{"0"*(@digits-1)}").to_i
  end
  def end_digits
    ("#{9}#{"9"*(@digits-1)}").to_i
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
