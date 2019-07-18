class Fibonacci
  def sum_even()
    a,b,c = 0,1,0
    fibonacci = []
    while c < 4_000_000
      c = a + b
      fibonacci << c
      a = b
      b = c
    end
    sum = fibonacci.select { |c| c.even? && c < 4_000_000}.sum
    puts "The sum of the even values of the fibonacci series up to 4000000 is: #{sum}"
  end
end
exercise = Fibonacci.new
exercise.sum_even()