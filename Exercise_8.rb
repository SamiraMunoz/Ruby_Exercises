class DifferenceSquare
  def sum_square
    sum_square = (1..100).inject { |sum, num| sum + num**2 }
    sum_num = ((1..100).inject { |sum, num| sum + num })**2
    sum_num -  sum_square
  end
end
