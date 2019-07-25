class PrimeFactors
  def initialize(largest_factor)
    @largest_factor = largest_factor
  end
  def largest_prime_factor
    factors = 0
    2.upto(@largest_factor) do |num|
      next if @largest_factor % num != 0
      factors = num
      @largest_factor = @largest_factor/num
    end
    factors
  end
end
