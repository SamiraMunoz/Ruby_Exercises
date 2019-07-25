class Multiples3and5
  def initialize(num)
    @num = num
  end
  def sum_multiples
    (1...@num).select { |num| (num % 3) == 0 || (num % 5) == 0 }.sum
  end
end

