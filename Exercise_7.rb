class FactorialNumber
  def initialize(num)
    @num = num
  end
  def factorial
    (1..@num).inject(1) { |product, num| product * num }
  end
end
puts "Enter a number to give your factorial."
num = Integer(gets.chomp).abs
factorial_num = FactorialNumber.new(num)
puts "The factorial number is: #{factorial_num.factorial}"