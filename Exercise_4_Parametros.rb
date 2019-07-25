class Palindrome
  def initialize(digits)
    @digits = digits
  end
  def digit_product
    begin
      raise ArgumentError, "El argumento no es número entero." unless @digits > 1
      start_digits = ("#{7}#{"0"*(@digits-1)}").to_i
      end_digits = ("#{9}#{"9"*(@digits-1)}").to_i
      mayor = 0
      start_digits.upto(end_digits) do |x|
        x.upto(end_digits) do |y|
          num = (x * y).to_s
          next if num != num.reverse
          num = num.to_i
          mayor = num if mayor < num
        end
      end
    end
    mayor
  end
end