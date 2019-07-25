class Multiples3and5
  def sum_multiples
    mul_3_and_5 = (1...1000).select { |num| (num % 3) == 0 || (num % 5) == 0 }
    mul_3_and_5.inject { |sum, num| sum + num }
  end
end
