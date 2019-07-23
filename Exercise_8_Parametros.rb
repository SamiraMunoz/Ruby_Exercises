class DifferenceSquare
  def initialize(end_number)
    @end_number = end_number
  end
  def sum_square
    sum_square = (1..@end_number).inject { |sum, num| sum + num**2 }
    sum_num = ((1..@end_number).inject { |sum, num| sum + num })**2
    sum_num -  sum_square
  end
end
puts "Enter until what value you want to find the difference of squares"
end_number = Integer(gets.chomp)
difference = DifferenceSquare.new(end_number)
puts "The difference is #{difference.sum_square}"