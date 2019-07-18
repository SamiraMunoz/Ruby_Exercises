class Palindrome
  def palindrome_word(word)
  	puts word == word.reverse ? "Is palindrome" : "It's not palindrome"
  end
end
exercise = Palindrome.new
puts "Enter a word"
word = (gets.chomp).downcase
exercise.palindrome_word(word)

