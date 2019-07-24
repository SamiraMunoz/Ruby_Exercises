require 'prime'
class Prime10001
  def primes
    prime = Prime.first 10001
    prime.max
  end
end
prime = Prime10001.new
puts "The 10 001st prime number is: #{prime.primes}"