class Palindrome
  def initialize(digits)
    @digits = digits-1
  end
  def three_digit_product
    start_digits = ("#{7}#{"0"*@digits}").to_i
    end_digits = ("#{9}#{"9"*@digits}").to_i
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