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

  def validation_update(hash)
    first_name = validation_first_name?(hash[:first_name])
    last_name = validation_last_name?(hash[:last_name])
    email = validation_email?(hash[:email])
    age = validation_age?(hash[:age])
    addres = validation_addres?(hash[:addres])
  end

  def validation_first_name?(first_name)
    if first_name.class != NilClass
      if first_name_empty?(first_name)
        raise EmptyError, 'The argument is empty'
      elsif first_name_integer?(first_name) || first_name_float?(first_name)
        raise InvalidNumberError, 'The argunment is a numeric'
      end
    end
  end

  def validation_last_name?(last_name)
    if last_name.class != NilClass
      if last_name_empty?(last_name)
        raise EmptyError, 'The argument is empty'
      elsif last_name_integer?(last_name) || last_name_float?(last_name)
        raise InvalidNumberError, 'The argunment is a numeric'
      end
    end
  end

  def validation_email?(email)
    if email.class != NilClass
      if email_empty?(email)
        raise EmptyError, 'The argument is empty'
      elsif email_integer?(email) || email_float?(email)
        raise InvalidNumberError, 'The argunment is a numeric'
      elsif email?(email).nil?
        raise InvalidEmailError, 'Email is invalid'
      end
    end
  end

  def validation_age?(age)
    if age.class != NilClass
      if age_string?(age)
        raise InvalidStringError, 'The argunment is a String'
      elsif age_negative?(age) || age_float?(age)
        raise InvalidNumberError, 'The argument is negative or float'
      end
    end
  end

  def validation_addres?(addres)
    if addres.class != NilClass
      raise InvalidNumberError, 'The argument is float' if addres_float?(addres)
    end
  end

  def invalid_first_name?(first_name)
    if first_name_empty?(first_name)
      raise EmptyError, 'The argument is empty'
    elsif first_name_integer?(first_name) || first_name_float?(first_name)
      raise InvalidNumberError, 'The argunment is a numeric'
    end
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
    elsif email?(email).nil?
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

  def email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end

  def invalid_age?(age)
    if age_string?(age)
      raise InvalidStringError, 'The argunment is a String'
    elsif age_negative?(age) || age_float?(age)
      raise InvalidNumberError, 'The argument is negative or float'
    end
  end

  def age_string?(age)
    age.class == String && age.to_i.zero?
  end

  def age_negative?(age)
    age.to_i.negative?
  end

  def age_float?(age)
    age.class == Float
  end

  def invalid_addres?(addres)
    raise InvalidNumberError, 'The argument is float' if addres_float?(addres)
  end

  def addres_float?(addres)
    addres.class == Float
  end
end
