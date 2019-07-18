class Palindrome
  def palindrome_product()
    mayor = 0
    100.upto(999) do |x|
      x.upto(999) do |y|
        num = (x*y).to_s
        next if num != num.reverse
          num = num.to_i
          mayor = num if mayor < num
      end
    end
    puts "Largest palindrome made from the product of two 3-digit numbers is: #{mayor}" 
  end
end
exercise = Palindrome.new
exercise.palindrome_product()