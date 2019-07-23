class Multiples3and5
  def initialize(num)
    @num = num
  end
  def sum_multiples
    sum  = (1...@num).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
  end
end
puts "Enter until what value you want to find the sum of all the multiples of 3 or 5"
end_number = Integer(gets.chomp)
sum_below_n = Multiples3and5.new(end_number)
puts "The sum of all multiples of 3 or 5 below #{end_number} is: #{sum_below_n.sum_multiples}"
