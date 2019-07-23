class Palindrome
  def initialize(word)
    @word = word
  end
  def equal_letters?
  	@word == @word.reverse 
  end
end
puts "Enter a word"
word = (gets.chomp).downcase
is_palindrome = Palindrome.new(word)
puts is_palindrome.equal_letters? == true ? "Is palindrome" : "It's not palindrome" 

