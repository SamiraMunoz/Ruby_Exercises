require 'minitest/autorun'
require_relative 'User.rb'

describe User do
  it "when parameters are correct" do
    users = User.new('1047','Samira','Muñoz','Smu@gmail',19,nil)
    users.create.must_be_instance_of(Array)
  end
  it "when ID is integer" do
    users = User.new(362,'Samira','Muñoz','gmail',20,nil)
    users.create.must_be_instance_of(Array)
  end
  it "when ID is empty " do
    err = lambda { User.new(nil,'Samira','Muñoz','Smu@gmail',21,"Calle 7") }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "when ID is negative number" do 
    err = lambda { User.new(-240,'Samira','Muñoz','Smu@gmail',22,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is negative'
  end
  it "when first name is empty " do
    err = lambda { User.new('300','','Muñoz','Smu@gmail',23,"Calle 7") }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "when frist name is integer" do 
    err = lambda { User.new('777',8,'Muñoz','Smu@gmail',24,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when frist name is float" do 
    err = lambda { User.new('47',-8,'Muñoz','Smu@gmail',25,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when last name is empty " do
    err = lambda { User.new('12','Samira',nil,'Smu@gmail',26,"Calle 7") }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "when last name is integer" do 
    err = lambda { User.new('98','Samira',8,'Smu@gmail',27,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when last name is float" do 
    err = lambda { User.new('10','Samira',-8,'Smu@gmail',28,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when email is empty " do
    err = lambda { User.new('09','Samira','Muñoz','',29,"Calle 7") }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "when email is integer" do 
    err = lambda { User.new('57','Samira','Muñoz',8,30,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when email is float" do 
    err = lambda { User.new('9','Samira','Muñoz',-8,31,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "when age is empty " do
    err = lambda { User.new('990','Samira','Muñoz','@gmai',"sam","Calle 7") }.must_raise(InvalidStringError)
    err.message.must_match 'The argunment is a String'
  end
  it "when age is negative number" do 
    err = lambda { User.new('90','Samira','Muñoz','gss',-19,"Calle 7") }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is negative'
  end
  it "when age is a string number" do 
    users = User.new('20','Samira','Muñoz','@gmail','32',nil)
    users.create.must_be_instance_of(Array)
  end
  it "when age and addres is nil" do
    users = User.new('65','Samira','Muñoz','il',nil,nil)
    users.create.must_be_instance_of(Array)
  end
  it "when email invalid" do
    err = lambda { User.new(69,'Samira','Munoz','gs',34,nil)}.must_raise(EmailValidationError)
    err.message.must_match 'Email already exists'
  end
  it "when email invalid" do
    err = lambda { User.new(18,'Samira','Munoz','gss',34,nil)}.must_raise(IdValidationError)
    err.message.must_match 'ID already exists'
  end
end