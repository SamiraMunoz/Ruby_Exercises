require_relative 'User_Validation.rb'
class EmailValidationError < StandardError; end
class IdValidationError < StandardError; end
class NotFound < StandardError; end

class User 
  attr_accessor :hash
  include Validation
  $users = []
  
  def initialize(**user)
    @hash = user 
  end

  def email_unique?(email)
    email_uni = false
    $users.each do |user|
      if user[:email] == hash[:email]
        raise EmailValidationError, 'Email already exists'
      end
    end
    email_uni
  end

  def create
    return if email_unique?(@email) || validation_create(self)
    id = $users.length
    @hash[:id] = id
    $users << @hash
  end
end