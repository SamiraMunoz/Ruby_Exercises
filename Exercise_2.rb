class Fibonacci
  def sum_even
    ar_fibonacci = []
    a,b,c = 0,1,0
    loop do
      c = a + b
      a = b
      b = c
      ar_fibonacci << c if c.even? 
      break if c > 4_000_000
    end
    ar_fibonacci.inject { |sum, n| sum + n } 
  end
end


