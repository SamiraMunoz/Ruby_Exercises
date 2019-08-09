require 'minitest/autorun'
require_relative 'User.rb'

describe User do
  describe 'the success instance methods' do
    it 'creates the user successfully' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'm@gmail.com',
        age: 18, addres: 'calle 7'
      ).create.must_be_instance_of(Array)
    end
    it 'creates the user successfully when addres or age are nil' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 's@gmail.com',
        age: nil, addres: nil
      ).create.must_be_instance_of(Array)
    end
    it 'updates user based on the find id' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'sam@gmail.com',
        age: 18, addres: 'calle 7'
      ).create
      user = User.find(2)
      user.update(
        last_name: 'sa'
      ).must_be_instance_of(Array)
    end
    it 'deletes user based on the find id' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'sami@gmail.com',
        age: 18, addres: 'calle 7'
      ).create
      user = User.find(1)
      user.destroy.must_be_instance_of(Array)
    end
  end
  describe 'the unsuccess instance methods' do
    it 'throws an error to create when first name is empty' do
      err = lambda {
        User.new(
          first_name: '',
          last_name: 'Muñoz',
          email: 'sa@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when first name is integer' do
      err = lambda {
        User.new(
          first_name: 9,
          last_name: 'Muñoz',
          email: 'd@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.new(
          first_name: 9.4,
          last_name: 'Muñoz',
          email: 'pi@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when last name is empty' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: '',
          email: 'samir@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when last name is integer' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 9,
          email: 'da@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 9.4,
          email: 'samiram@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when age is string' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'samiramu@gmail.com',
          age: 'sam',
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidStringError)
      err.message.must_match 'The argunment is a String'
    end
    it 'throws an error to create when age is float' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'samiramun@gmail.com',
          age: 2.3,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to create when age is negative' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'samiramun@gmail.com',
          age: -2,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to create when email is empty' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: '',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when email does not have the structure' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'samigmail',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise(InvalidEmailError)
      err.message.must_match 'Email is invalid'
    end
    it 'throws an error to create when email already exists' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'p@gmail.com',
        age: 18, addres: 'calle 7'
      ).create
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'p@gmail.com',
          age: 20,
          addres: 'calle 7'
        ).create
      }.must_raise
      err.message.must_match 'Email already exists'
    end
    it 'throws an error to create when addres is float' do
      err = lambda {
        User.new(
          first_name: 'Samira',
          last_name: 'Muñoz',
          email: 'piza78@gmail.com',
          age: 20,
          addres: -2.3
        ).create
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is float'
    end
    it 'throws an error to update when first name is empty ' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'h@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          first_name: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to update when first name is integer' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'q@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          first_name: 9
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to update when first name is float' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'piz@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          first_name: 9.9
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to update when last name is empty' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'piza@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          last_name: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to update when last name is integer' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'pizar@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          last_name: 9
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to update when first name is float' do
      User.new(
        first_name: 'Samira',
        last_name: 'munoz',
        email: 'pizarr@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          last_name: 9.4
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to update when age is string' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'pizarro@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          age: 'sam'
        )
      }.must_raise(InvalidStringError)
      err.message.must_match 'The argunment is a String'
    end
    it 'throws an error age update when age is float' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'pizarro1@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          age: 2.3
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to update when age is negative' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'pizarro10@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          age: -2
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to update when email is empty' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'c@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          email: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to update when email does not have the structure' do
      User.new(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'ch@gmail.com',
        age: 20,
        addres: 'calle 7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          email: 'sadas'
        )
      }.must_raise(InvalidEmailError)
      err.message.must_match 'Email is invalid'
    end
    it 'throws an error to update when addres is float' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'cha@gmail.com',
        age: 20,
        addres: 'calle7'
      ).create
      user = User.find(1)
      err = lambda {
        user.update(
          addres: 2.8
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is float'
    end
  end
  describe 'the success class methods' do
    it 'creates the user successfully' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aq@gmail.com',
        age: 18, addres: 'calle 7'
      ).must_be_instance_of(Array)
    end
    it 'creates the user successfully when addres or age are nil' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aqu@gmail.com',
        age: nil, addres: nil
      ).must_be_instance_of(Array)
    end
    it 'counts the users' do
      User.count.must_be_instance_of(Integer)
    end
    it 'lists the users' do
      User.all.must_be_instance_of(Array)
    end
    it 'searches where the first name is typed' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aqua2@gmail.com',
        age: nil, addres: nil
      )
      User.where(
        first_name: 'Samira'
      ).must_be_instance_of(Array)
    end
    it 'searches where the last name is typed' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aquam@gmail.com',
        age: nil, addres: nil
      )
      User.where(
        last_name: 'Munoz'
      ).must_be_instance_of(Array)
    end
    it 'searches where the email is typed' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aquama@gmail.com',
        age: nil, addres: nil
      )
      User.where(
        email: 'aquama@gmail.com'
      ).must_be_instance_of(Array)
    end
    it 'searches where the age is typed' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aqua@gmail.com',
        age: 15, addres: nil
      )
      User.where(
        age: 15
      ).must_be_instance_of(Array)
    end
    it 'searches where the addres is typed' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'aqua99@gmail.com',
        age: 15, addres: 'Calle 7'
      )
      User.where(
        addres: 'Calle 7'
      ).must_be_instance_of(Array)
    end
    it 'finds a user based on id' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'aquam8@gmail.com',
        age: 20,
        addres: 'calle7'
      ).create
      User.find(1).must_be_instance_of(User)
    end
  end
  describe 'the unsuccess class methods' do
    it 'throws an error to create when first name is empty' do
      err = lambda {
        User.create(
          first_name: '',
          last_name: 'Muñoz',
          email: 'hola@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when first name is integer' do
      err = lambda {
        User.create(
          first_name: 9,
          last_name: 'Muñoz',
          email: 'qposia7@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.create(
          first_name: 9.4,
          last_name: 'Muñoz',
          email: 'qw@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when last name is empty' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: '',
          email: 'qwe@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when last name is integer' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 9,
          email: 'zx@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 9.4,
          email: 'po@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argunment is a numeric'
    end
    it 'throws an error to create when age is string' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'dsa8@gmail.com',
          age: 'sam',
          addres: 'calle 7'
        )
      }.must_raise(InvalidStringError)
      err.message.must_match 'The argunment is a String'
    end
    it 'throws an error to create when age is float' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'aad@gmail.com',
          age: 2.3,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to create when age is negative' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: '987a@gmail.com',
          age: -2,
          addres: 'calle 7'
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is negative or float'
    end
    it 'throws an error to create when email is empty' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: '',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The argument is empty'
    end
    it 'throws an error to create when email does not have the structure' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'adsdad',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise(InvalidEmailError)
      err.message.must_match 'Email is invalid'
    end
    it 'throws an error to create when email already exists' do
      User.create(
        first_name: 'Samira',
        last_name: 'Munoz',
        email: 'pdoasipo@gmail.com',
        age: 18, addres: 'calle 7'
      )
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Munoz',
          email: 'pdoasipo@gmail.com',
          age: 20,
          addres: 'calle 7'
        )
      }.must_raise
      err.message.must_match 'Email already exists'
    end
    it 'throws an error to create when addres is float' do
      err = lambda {
        User.create(
          first_name: 'Samira',
          last_name: 'Muñoz',
          email: 'holame8@gmail.com',
          age: 20,
          addres: -2.3
        )
      }.must_raise(InvalidNumberError)
      err.message.must_match 'The argument is float'
    end
    it 'throws an error when the find id does not exist' do
      User.new(
        first_name: 'Samira',
        last_name: 'Muñoz',
        email: 'aquam898@gmail.com',
        age: 20,
        addres: 'calle7'
      ).create
      err = lambda {
        User.find(400)
      }.must_raise
      err.message.must_match 'Record not found'
    end
  end
end
