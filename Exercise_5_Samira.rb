class Prime10001
  def primes
    finality,counter = 2,0
    loop do
      num_prime = (1..finality).select { | num | finality % num == 0 }.count
      counter += 1 if num_prime == 2
      finality += 1
      break if counter>10001
    end
    finality-1
  end
end
prime = Prime10001.new
puts "The 10 001st prime number is: #{prime.primes}."