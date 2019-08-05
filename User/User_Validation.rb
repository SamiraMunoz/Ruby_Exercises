class EmptyError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidNumberError < StandardError; end
class InvalidEmailError < StandardError; end

module Validation
  def validation_create(user)
    first_name = invalid_first_name?(user.hash[:first_name])
    last_name = invalid_last_name?(user.hash[:last_name])
    email = invalid_email?(user.hash[:email])
    age = invalid_age?(user.hash[:age])
    addres = invalid_addres?(user.hash[:addres])
  end

  def validation_first_name(user)
    first_name = invalid_first_name?(user.hash[:first_name])
  end

  def validation_last_name(user)
    last_name = invalid_last_name?(user.hash[:last_name])
  end

  def validation_email(user)
    email = invalid_email?(user.hash[:email])
  end

  def validation_age(user)
    age= invalid_age?(user.hash[:age])
  end

  def validation_addres(user)
    addres = invalid_addres?(user.hash[:addres])
  end

  def invalid_first_name?(first_name)
    if first_name_empty?(first_name)
      raise EmptyError, 'The argument is empty'
    elsif first_name_integer?(first_name) || first_name_float?(first_name)
      raise InvalidNumberError, 'The argunment is a numeric'
    end
    first_name
  end

  def first_name_empty?(first_name)
    first_name.nil? || first_name == ''
  end

  def first_name_integer?(first_name)
    first_name.class == Integer
  end

  def first_name_float?(first_name)
    first_name.class == Float
  end

  def invalid_last_name?(last_name)
    if last_name_empty?(last_name)
      raise EmptyError, 'The argument is empty'
    elsif last_name_integer?(last_name) || last_name_float?(last_name)
      raise InvalidNumberError, 'The argunment is a numeric'
    end
    last_name
  end

  def last_name_empty?(last_name)
    last_name.nil? || last_name == ''
  end

  def last_name_integer?(last_name)
    last_name.class == Integer
  end

  def last_name_float?(last_name)
    last_name.class == Float
  end

  def invalid_email?(email)
    if email_empty?(email)
      raise EmptyError, 'The argument is empty'
    elsif email_integer?(email) || email_float?(email)
      raise InvalidNumberError, 'The argunment is a numeric'
    elsif is_email?(email) == nil
      raise InvalidEmailError, 'Email is invalid'
    end
    email
  end

  def email_empty?(email)
    email.nil? || email == ''
  end

  def email_integer?(email)
    email.class == Integer
  end

  def email_float?(email)
    email.class == Float
  end

  def is_email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end

  def invalid_age?(age)
    if age_string?(age)
      raise InvalidStringError, 'The argunment is a String'
    elsif age_negative?(age) || age_float?(age)
      raise InvalidNumberError, 'The argument is negative or float' 
    end
    age
  end

  def age_string?(age)
    age.class == String && age.to_i == 0
  end

  def age_negative?(age)
    age.to_i < 0
  end

  def age_float?(age)
    age.class == Float
  end

  def invalid_addres?(addres)
    if addres_float?(addres)
      raise InvalidNumberError, 'The argument is float'
    end
  end

  def addres_float?(addres)
    addres.class == Float
  end
end