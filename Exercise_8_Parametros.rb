require_relative 'Exercise_8_Validation.rb'

class DifferenceSquare < Validation
  def initialize(end_number)
    @end_number = self.parse_number(end_number)
  end
  
  def sum_square
    sum_square = (1..@end_number).inject { |sum, num| sum + num**2 }
    sum_num = ((1..@end_number).inject { |sum, num| sum + num })**2
    sum_num -  sum_square
  end
end