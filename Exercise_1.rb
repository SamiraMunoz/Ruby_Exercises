class Multiples3And5
  def sum_multiples
    sum  = (1...1000).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
  end
end
exercise = Multiples3And5.new
puts "The sum of all multiples of 3 or 5 below 1000 is: #{exercise.sum_multiples}."