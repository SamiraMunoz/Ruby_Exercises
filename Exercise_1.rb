class Multiples3and5
  def sum_multiples
    mul_3_and_5 = (1...1000).select { |num| (num % 3) == 0 || (num % 5) == 0 }
    mul_3_and_5.inject { |sum, num| sum + num }
  end
end
sum_below_1000 = Multiples3and5.new
puts "The sum of all multiples of 3 or 5 below 1000 is: #{sum_below_1000.sum_multiples}"