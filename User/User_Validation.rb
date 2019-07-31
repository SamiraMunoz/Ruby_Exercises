class EmptyError < StandardError; end
class InvalidStringError < StandardError; end
class InvalidNumberError < StandardError; end

module Validation 
  def parse_first(first_name)
    return if invalid_first_name?(first_name)
    first_name.chomp
  end

  def parse_last(last_name)
    return if invalid_last_name?(last_name)
    last_name.chomp
  end

  def parse_age(age)
    return if invalid_age?(age)
    age.to_i
  end

  def parse_addres(addres)
    addres
  end

  def invalid_id?(id)
    if id_empty?(id)
      raise EmptyError, 'The argument is empty'
    elsif id_negative?(id)
      raise InvalidNumberError, 'The argument is negative' 
    end 
  end

  def id_empty?(id)
    id.nil? || id == ''
  end

  def id_negative?(id)
    id.to_i < 0
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
    end
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

  def email_unique?(email)
    email_o = false
    $users.each do |user|
      email_o == true if user.value?(email) == true
    end
    email_o
  end

  def invalid_age?(age)
    if age_string?(age)
      raise InvalidStringError, 'The argunment is a String'
    elsif age_negative?(age) || age_float(age)
      raise InvalidNumberError, 'The argument is negative or float' 
    end
  end

  def age_string?(age)
    age.class == String && age.to_i == 0
  end

  def age_negative?(age)
    age.to_i < 0
  end

  def age_float(age)
    age.class == Float
  end
end