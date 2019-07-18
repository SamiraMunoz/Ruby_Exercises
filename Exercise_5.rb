require 'prime'
class Prime_10001
  def prime_10001
    prime = Prime.first 10001
    puts "The 10 001st prime number is: #{prime.max}" 
    prime.max
  end
end
exercise = Prime_10001.new
exercise.prime_10001