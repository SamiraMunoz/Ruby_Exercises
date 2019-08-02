require_relative 'User_Validation.rb'
class EmailValidationError < StandardError; end
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

  def count 
    $users.count
  end

  def all
    $users
  end

  def find
    user_find = $users.select{|user| user[:id] == hash[:id]}
    if user_find.empty?
      raise NotFound, 'ID not found'
    else
      user_find 
    end
  end

  def where
    users_where = []
    counter_id, counter_first, counter_last, counter_email, counter_age, counter_addres = 0,0,0,0,0,0
    $users.each do |user|
      if @hash[:id].class != NilClass
        if user[:id] == @hash[:id] 
          users_where << user 
        else 
          counter_id += 1
        end  
        raise NotFound, 'ID not found' if counter_id == $users.length
      end
      if @hash[:first_name].class != NilClass
        if user[:first_name] == @hash[:first_name] 
          users_where << user
        else 
          counter_first += 1
        end  
        raise NotFound, 'First name not found' if counter_first == $users.length
      end
      if @hash[:last_name].class != NilClass
        if user[:last_name] == @hash[:last_name] 
          users_where << user
        else 
          counter_last += 1
        end  
        raise NotFound, 'Last name not found' if counter_last == $users.length
      end
      if @hash[:email].class != NilClass
        if user[:email] == @hash[:email] 
          users_where << user 
        else 
          counter_email += 1
        end  
        raise NotFound, 'Email not found' if counter_email == $users.length
      end
      if @hash[:age].class != NilClass
        if user[:age] == @hash[:age] 
          users_where << user
        else 
          counter_age += 1
        end  
        raise NotFound, 'Age not found' if counter_age == $users.length
      end
      if @hash[:addres].class != NilClass
        if user[:addres] == @hash[:addres] 
          users_where << user
        else 
          counter_addres += 1
        end  
        raise NotFound, 'Addres not found' if counter_addres == $users.length
      end
    end
    if users_where.empty?
      raise NotFound, 'Nothing was found'
    else
      users_where
    end 
  end

  def destroy
    user_destroy = false
    $users.each do |user|
      if user[:id_hash] == @id
        $users.delete(user) 
        user_destroy = true
      end
    end 
    if user_destroy
      $users 
    else
      raise NotFound, 'ID not found'
    end
  end 
end