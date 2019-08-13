# frozen_string_literal: true

class EmptyError < StandardError; end
class StringError < StandardError; end
class NumberError < StandardError; end
class EmailError < StandardError; end

# Module Validation
module Validation
  def validation_create(user)
    invalid_first_name?(user.hash[:first_name])
    invalid_last_name?(user.hash[:last_name])
    invalid_email?(user.hash[:email])
    invalid_age?(user.hash[:age])
    invalid_address?(user.hash[:address])
  end

  def keys
    %i[first_name last_name email age address]
  end

  def validation_update(hash)
    validation_first_name?(hash[:first_name])
    validation_last_name?(hash[:last_name])
    validation_email?(hash[:email])
    validation_age?(hash[:age])
    validation_address?(hash[:address])
  end

  def field_empty?(field)
    field.nil? || field == ''
  end

  def field_integer?(field)
    field.class == Integer
  end

  def field_float?(field)
    field.class == Float
  end

  def field_string?(field)
    field.class == String || field.to_i.zero?
  end

  def email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end

  def age_negative?(age)
    age.negative?
  end

  def validation_first_name?(first_name)
    return if first_name.class == NilClass

    raise EmptyError, 'The first name is an empty' if field_empty?(first_name)
    raise NumberError, 'The first name is a integer' if field_integer?(first_name)
    raise NumberError, 'The first name is a float' if field_float?(first_name)
  end

  def invalid_first_name?(first_name)
    raise EmptyError, 'The first name is an empty' if field_empty?(first_name)
    raise NumberError, 'The first name is a integer' if field_integer?(first_name)
    raise NumberError, 'The first name is a float' if field_float?(first_name)
  end

  def validation_last_name?(last_name)
    return if last_name.class == NilClass

    raise EmptyError, 'The last name is an empty' if field_empty?(last_name)
    raise NumberError, 'The last name is a integer' if field_integer?(last_name)
    raise NumberError, 'The last name is a float' if field_float?(last_name)
  end

  def invalid_last_name?(last_name)
    raise EmptyError, 'The last name is an empty' if field_empty?(last_name)
    raise NumberError, 'The last name is a integer' if field_integer?(last_name)
    raise NumberError, 'The last name is a float' if field_float?(last_name)
  end

  def validation_email?(email)
    return if email.class == NilClass

    raise EmptyError, 'The email is an empty' if field_empty?(email)
    raise EmailError, 'Email is invalid' if email?(email).nil?
  end

  def invalid_email?(email)
    raise EmptyError, 'The email is an empty' if field_empty?(email)
    raise EmailError, 'Email is invalid' if email?(email).nil?
  end

  def validation_age?(age)
    return if age.class == NilClass

    raise NumberError, 'The age is a float' if field_float?(age)
    raise StringError, 'The age is string' if field_string?(age)
    raise NumberError, 'The age is negative' if age_negative?(age)
  end

  def invalid_age?(age)
    raise NumberError, 'The age is a float' if field_float?(age)
    raise StringError, 'The age is string' if field_string?(age)
    raise NumberError, 'The age is negative' if age_negative?(age)
  end

  def validation_address?(address)
    return if address.class == NilClass

    raise NumberError, 'The address is a float' if field_float?(address)
  end

  def invalid_address?(address)
    raise NumberError, 'The address is a float' if field_float?(address)
  end
end
