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
equal_reading = Palindrome.new(word)
puts equal_reading.equal_letters? ? "Is palindrome" : "It's not palindrome" 


