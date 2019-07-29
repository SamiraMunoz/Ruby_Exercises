class EmptyWordError < StandardError; end
class InvalidNumericError < StandardError; end

class Palindrome
  def initialize(word)
    @word = self.parse_word(word)
  end

  def parse_word(word)
    return if invalid_word?(word)
    word.downcase
  end  
  
  def invalid_word?(word)
    if word_empty?(word)
      raise EmptyWordError, 'The argument is empty'
    elsif word_integer?(word) || word_float?(word)
      raise InvalidNumericError, 'The argunment is a numeric'
    end
  end  

  def word_empty?(word)
    word.nil? || word == ''
  end

  def word_integer?(word)
    word.class == Integer
  end

  def word_float?(word)
    word.class == Float
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