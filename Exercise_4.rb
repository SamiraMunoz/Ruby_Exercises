class Palindrome
  def three_digit_product
    mayor = 0
    700.upto(999) do |x|
      x.upto(999) do |y|
        num = (x * y).to_s
        next if num != num.reverse
        num = num.to_i
        mayor = num if mayor < num
      end
    end
    mayor
  end
end
palindrome = Palindrome.new
puts "Largest palindrome made from the product of two 3-digit numbers is: #{palindrome.three_digit_product}" 