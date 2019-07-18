class Difference
  def sum_square()
    sum_square = (1..100).inject { |sum, num| sum + num**2 }
    sum_num = ((1..100).inject { |sum, num| sum + num })**2
    subtraction = ( sum_num -  sum_square)
    puts "The difference is #{subtraction}"
  end
end
exercise = Difference.new
exercise.sum_square()