class Palindrome
  def initialize(word)
    @word = word
  end
  def palindrome_word
    counter = -1 
    letters = @word.length
    end_cycle = (letters/2)-1
    0.upto(end_cycle) do |letter|
      counter +=1 if @word[letter]==@word[letters-1]
      letters -= 1
    end
    counter == end_cycle ? true : false
  end
end
puts "Enter a word"
word = (gets.chomp).downcase
is_palindrome = Palindrome.new(word)
puts is_palindrome.palindrome_word == true ? "Is palindrome" : "It's not palindrome"
