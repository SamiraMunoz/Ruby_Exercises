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
    User.new({id:'', first_name: 'Samira', last_name: 'Muñoz', email: 'samiramunoz10@gmail.com', age: 18, addres: 'calle 7'}).create.must_be_instance_of(Array)
  end
  it "Method to count" do 
    User.new.count.must_be_instance_of(Integer)
  end
  it "Method to all" do 
    User.new.all.must_be_instance_of(Array)
  end
  it "Method to find when id exists" do 
    User.new({id: '', first_name: 'Samira', last_name: 'Pizarro', email: 'samiramunozp10@gmail.com', age: 18, addres: 'calle 7'}).create
    users = User.new({id:0})
    users.find.must_be_instance_of(Array)
  end
  it "Method to find when id not found" do
    err = lambda {User.new({id: 30}).find}.must_raise(NotFound)
    err.message.must_match 'ID not found'
  end
  it "Method to where when Id is 0 and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Munoz', email: 'd@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0}).where.must_be_instance_of(Array)
  end
  it "Method to where when Id is 30 and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'da@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({id: 30}).where}.must_raise(NotFound)
    err.message.must_match 'ID not found'
  end
  it "Method to where when first name is Daniel and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'dan@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({first_name: 'Daniel'}).where}.must_raise(NotFound)
    err.message.must_match 'First name not found'
  end
  it "Method to where when first name is Samira and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'dani@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({first_name: 'Samira'}).where.must_be_instance_of(Array)
  end
  it "Method to where when last name is Osorio and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'danielos@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({last_name: 'Osorio'}).where}.must_raise(NotFound)
    err.message.must_match 'Last name not found'
  end
  it "Method to where when last name is Munoz and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Munoz', email: 'danielo@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({last_name: 'Munoz'}).where.must_be_instance_of(Array)
  end
  it "Method to where when email is 'danielopok@gmail.com' and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'danie@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({email: 'danielopok@gmail.com' }).where}.must_raise(NotFound)
    err.message.must_match 'Email not found'
  end
  it "Method to where when email is daniel@gmail.com and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'daniel@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({email: 'daniel@gmail.com'}).where.must_be_instance_of(Array)
  end
  it "Method to where when age is 25 and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'daniela@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({age: 25}).where}.must_raise(NotFound)
    err.message.must_match 'Age not found'
  end
  it "Method to where when age is 18 and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'danielaoso@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({age: 18}).where.must_be_instance_of(Array)
  end
  it "Method to where when addres is calle 8 and it's not in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'danielamun@gmail.com', age: 18, addres: 'calle 7'}).create
    err = lambda {User.new({addres: 'calle 8'}).where}.must_raise(NotFound)
    err.message.must_match 'Addres not found'
  end
  it "Method to where when age is 18 and it's in the array" do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'danielamunoz@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({addres: 'calle 7'}).where.must_be_instance_of(Array)
  end
  it "Method to destroy when id exists" do 
    User.new({id:1}).destroy.must_be_instance_of(Array)
  end
  it "Method to destroy  when id not found" do
    err = lambda {User.new({id: 50}).destroy}.must_raise(NotFound)
    err.message.must_match 'ID not found'
  end
  it "Method to update first name when id is 0 " do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'mu@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0,first_name: 'sam'}).update.must_be_instance_of(Array)
  end
  it "Method to update last name when id is 0 " do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'mun@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0,last_name: 'Pizarro'}).update.must_be_instance_of(Array)
  end
  it "Method to update email name when id is 0 " do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'munoz@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0,email: 'sam@gma.com'}).update.must_be_instance_of(Array)
  end
  it "Method to update age when id is 0 " do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'munozpi@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0,age: 18}).update.must_be_instance_of(Array)
  end
  it "Method to update addres when id is 0 " do
    User.new({id: '', first_name: 'Samira', last_name: 'Muñoz', email: 'munozpiz@gmail.com', age: 18, addres: 'calle 7'}).create
    User.new({id: 0,addres: 'calle 9'}).update.must_be_instance_of(Array)
  end
  it "Method to update when id it's not in the array" do
    err = lambda {User.new({id: 50}).update}.must_raise(NotFound)
    err.message.must_match 'ID not found'
  end
end