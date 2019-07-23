class Fibonacci
  def sum_even
    fibonacci = []
    a,b,c = 0,1,0
    loop do
      c = a + b
      a = b
      b = c
      fibonacci << c if c.even? 
      break if c > 4_000_000
    end
    fibonacci.inject { |sum, n| sum + n } 
  end
end
sum_even_fibonacci = Fibonacci.new
puts "The sum of the even values of the fibonacci series up to 4000000 is: #{sum_even_fibonacci.sum_even}."
