class Factors
  def factor(finality)
    puts "The factors of #{finality} are: "
    2.upto(finality) do | num |
      next if finality % num != 0
      finality = finality/num
      puts "#{num} is factor."
    end
   end
end
exercise = Factors.new
exercise.factor(13195)