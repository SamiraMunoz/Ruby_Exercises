class Palindrome
  def initialize(word)
    @word = word
  end
  def palindrome_word?
    counter = -1 
    letters = @word.length
    end_cycle = (letters/2)-1
    0.upto(end_cycle) do |letter|
      counter +=1 if @word[letter]==@word[letters-1]
      letters -= 1
    end
    counter == end_cycle 
  end
end
puts "Enter a word"
word = (gets.chomp).downcase
equal_reading = Palindrome.new(word)
puts equal_reading.palindrome_word? ? "Is palindrome" : "It's not palindrome"
