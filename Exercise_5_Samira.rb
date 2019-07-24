class Prime10001
  def primes
    first_primes = [2]
    c,num,counter = 1,3,0
    while c < 10001
      first_primes.each do |prime|
        counter += 1 if num % prime != 0
      end 
      if counter == first_primes.length
        first_primes << num
        c += 1
      end
      num += 1
      counter = 0
    end
    num-1
  end
end
prime = Prime10001.new
puts "The 10001st prime number is: #{prime.primes}."