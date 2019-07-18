class Factorial
  def factorial(finality)
     if finality != 0
        factorial = (1..finality).inject(1) { |product, num| product * num }
      end
      puts "The factorial number is: #{factorial}"
    end
end
exercise = Factorial.new
puts "Enter a number to give your factorial."
num = Float(gets.chomp).abs
exercise.factorial(num)

