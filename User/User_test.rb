require 'minitest/autorun'
require_relative 'User.rb'

describe User do
  it "Method to create when first name is empty " do
    err = lambda { User.new({id:'', first_name: '', last_name: 'Muñoz', email: 's@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "Method to create when first name is integer " do
    err = lambda { User.new({id:'', first_name: 23, last_name: 'Muñoz', email: 'sa@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when first name is float " do
    err = lambda { User.new({id:'', first_name: 2.3, last_name: 'Muñoz', email: 'sam@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when last name is empty " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: '', email: 'sami@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "Method to create when last name is integer " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 23, email: 'samir@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when last name is float " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 2.3, email: 'samira@gmail.com', age: 20, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when age is string " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiram@gmail.com', age: 'sam', addres: 'calle 7'}).create }.must_raise(InvalidStringError)
    err.message.must_match 'The argunment is a String'
  end
  it "Method to create when age is float " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramu@gmail.com', age: 2.3, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is negative or float'
  end
  it "Method to create when age is negative " do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramu@gmail.com', age: -20, addres: 'calle 7'}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is negative or float'
  end
  it "Method to create when addres is float" do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramun@gmail.com', age: 20, addres: 2.3}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argument is float'
  end
  it "Method to create when email is empty" do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: '', age: 20, addres: nil}).create }.must_raise(EmptyError)
    err.message.must_match 'The argument is empty'
  end
  it "Method to create when addres is float" do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 23, age: 20, addres: nil}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when addres is float" do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 2.3, age: 20, addres: nil}).create }.must_raise(InvalidNumberError)
    err.message.must_match 'The argunment is a numeric'
  end
  it "Method to create when email doesn't have the structure" do
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramunozgmail', age: 20, addres: nil}).create }.must_raise(InvalidEmailError)
    err.message.must_match 'Email is invalid'
  end
  it "Method to create when email doesn't have the structure" do
    User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramuno@gmail.com', age: 20, addres: nil}).create
    err = lambda { User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramuno@gmail.com', age: 20, addres: nil}).create }.must_raise(EmailValidationError)
    err.message.must_match 'Email already exists'
  end
  it "Method to create when addres or age are nil" do
    User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramunoz@gmail.com', age: nil, addres: nil}).create.must_be_instance_of(Array)
  end
  it "Method to create when parameters are correct" do
    users = User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramunoz10@gmail.com', age: 18, addres: 'calle 7'})
    users.create.must_be_instance_of(Array)
  end
  it "Method to count" do 
    User.new.count.must_be_instance_of(Integer)
  end
  it "Method to all" do 
    User.new.all.must_be_instance_of(Array)
  end
  it "Method to find when id exists" do 
    User.new({id:0}).find.must_be_instance_of(Array)
  end
  it "Method to find when id not found" do
    err = lambda {User.new({id: 30}).find}.must_raise(NotFound)
    err.message.must_match 'ID not found'
  end
end