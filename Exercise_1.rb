class Multiples_3_and_5
  def sum_multiples()
    sum  = (1...1000).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
      puts "The sum of all multiples of 3 or 5 below 1000 is: #{sum}"
  end
end
exercise = Multiples_3_and_5.new
exercise.sum_multiples()