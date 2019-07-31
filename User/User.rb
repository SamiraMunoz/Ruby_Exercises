require_relative 'User_Validation.rb'
class EmailValidationError < StandardError; end
class IdValidationError < StandardError; end

class User 
  include Validation
  @@users = []
  hash = Hash.new
  hash = { id: 18 ,first_name: "JUAN", last_name: "VERGARA", email: "gs", age: 8 ,addres: "CALLE 7 " }
  @@users = [hash]

  def initialize(id,first_name,last_name,email,age,addres)
    @id = self.parse_id(id)
    @first_name = self.parse_first(first_name)
    @last_name = self.parse_last(last_name)
    @email = self.parse_email(email)
    @age = self.parse_age(age)
    @addres = self.parse_addres(addres) 
  end

  def parse_email(email)
    return if invalid_email?(email) || invalid_email_unique?(email)
    email
  end

  def parse_id(id)
    return if invalid_id?(id) || invalid_id_unique?(id)
    id
  end

  def invalid_id_unique?(id)
    if id_unique?(id)
      raise IdValidationError, 'ID already exists'
    end
  end

  def id_unique?(id)
    id_uni = false
    @@users.each do |user|
      id_uni = true if user[:id] == id
    end
    id_uni
  end

  def invalid_email_unique?(email)
    if email_unique?(email)
      raise EmailValidationError, 'Email already exists'
    end
  end

  def email_unique?(email)
    email_uni = false
    @@users.each do |user|
      email_uni = true if user[:email] == email
    end
    email_uni
  end

  def create
    hash = Hash.new
    hash = { id: @id ,first_name: @first_name, last_name: @last_name, email: @email, age: @age,addres: @addres }
    @@users << hash
  end

  def count 
    @@users.count
  end
  
  def all
    @@users
  end
end
