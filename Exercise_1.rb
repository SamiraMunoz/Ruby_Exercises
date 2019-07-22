class Multiples_3_and_5
  def sum_multiples
    sum  = (1...1000).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
  end
end
sum_below_1000 = Multiples_3_and_5.new
puts "The sum of all multiples of 3 or 5 below 1000 is: #{sum_below_1000.sum_multiples}"

