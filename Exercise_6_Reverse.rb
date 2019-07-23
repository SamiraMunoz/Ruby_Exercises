class Palindrome
  def initialize(word)
    @word = word
  end
  def palindrome_word
  	@word == @word.reverse ? true : false
  end
end
puts "Enter a word"
word = (gets.chomp).downcase
is_palindrome = Palindrome.new(word)
puts is_palindrome.palindrome_word == true ? "Is palindrome" : "It's not palindrome"