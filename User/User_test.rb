# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'user.rb'

describe User, '#create' do
  describe 'the success' do
    it 'creates the user successfully' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'm@gmail.com',
        age: 18, address: 'calle 7'
      )
      user.create.must_be_same_as(user)
    end
    it 'creates the user successfully when address or age are nil' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'mu@gmail.com',
        age: 10, address: nil
      )
      user.create.must_be_same_as(user)
    end
  end
end
describe User, '#create' do
  describe 'create first name unsuccess' do
    it 'throws an error to create when first name is empty' do
      err = lambda {
        User.new(
          first_name: '', last_name: 'Muñoz', email: 's@m.com', age: 10,
          address: nil
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The first name is an empty'
    end
    it 'throws an error to create when first name is integer' do
      err = lambda {
        User.new(
          first_name: 9, last_name: 'Muñoz', email: 'sa@m.com', age: nil,
          address: 'calle 7'
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a integer'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.new(
          first_name: 9.4, last_name: 'Muñoz', email: 'pi@gmail.com', age: nil,
          address: nil
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a float'
    end
  end
end
describe User, '#create' do
  describe 'create last name unsuccess' do
    it 'throws an error to create when last name is empty' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: '', email: 'q@m.com', age: 20,
          address: nil
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The last name is an empty'
    end
    it 'throws an error to create when last name is integer' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 9, email: 'qa@m.com', age: 20,
          address: 'calle 7'
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a integer'
    end
    it 'throws an error to create when last name is float' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 9.4, email: 'qi@g.com', age: 20,
          address: 'calle 7'
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a float'
    end
  end
end
describe User, '#create' do
  describe 'create age unsuccess' do
    it 'throws an error to create when age is string' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz', email: 'samiramu@gmail.com',
          age: 'sam', address: 'calle 7'
        ).create
      }.must_raise(StringError)
      err.message.must_match 'The age is string'
    end
    it 'throws an error to create when age is float' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz', email: 'samiramun@gmail.com',
          age: 2.3, address: 'calle 7'
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The age is a float'
    end
    it 'throws an error to create when age is negative' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz', email: 'samiramun@gmail.com',
          age: -2, address: 'calle 7'
        ).create
      }.must_raise(NumberError)
      err.message.must_match 'The age is negative'
    end
  end
end
describe User, '#create' do
  describe 'create email unsuccess' do
    it 'throws an error to create when email is empty' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz', email: '',
          age: 20, address: 'calle 7'
        ).create
      }.must_raise(EmptyError)
      err.message.must_match 'The email is an empty'
    end
    it 'throws an error to create when email does not have the structure' do
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz',email: 'samigmail',
          age: 20, address: 'calle 7'
        ).create
      }.must_raise(EmailError)
      err.message.must_match 'Email is invalid'
    end
    it 'throws an error to create when email already exists' do
      User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'p@gmail.com',
        age: 18, address: 'calle 7'
      ).create
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz',email: 'p@gmail.com',
          age: 20,address: 'calle 7'
        ).create
      }.must_raise(EmailError)
      err.message.must_match 'Email already exists'
    end
  end
end
describe User, '#create' do 
  it 'throws an error to create when address is float' do
    err = lambda {
      User.new(
        first_name: 'Samira', last_name: 'Muñoz', email: 'piza78@gmail.com',
        age: 20, address: -2.3
      ).create
    }.must_raise(NumberError)
    err.message.must_match 'The address is a float'
  end
end
describe User, '·create' do
  describe 'the success' do
    it 'creates the user successfully' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'aq@gmail.com',
        age: 18, address: 'calle 7'
      )
      user.must_be_same_as(user)
    end
    it 'creates the user successfully when address or age are nil' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'qw@gml.com',
        age: 10, address: nil
      )
      user.must_be_same_as(user)
    end
  end
end
describe User, '·create' do
  describe 'create first name unsuccess' do
    it 'throws an error to create when first name is empty' do
      err = lambda {
        User.create(
          first_name: '', last_name: 'Muñoz', email: 'hola@gmail.com', 
          age: 10, address: nil
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The first name is an empty'
    end
    it 'throws an error to create when first name is integer' do
      err = lambda {
        User.create(
          first_name: 9, last_name: 'Muñoz', email: 'po@m.com', age: nil,
          address: 'calle 7'
        )
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a integer'
    end
    it 'throws an error to create when first name is float' do
      err = lambda {
        User.create(
          first_name: 9.4, last_name: 'Muñoz', email: 'ops@.co', age: nil,
          address: nil
        )
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a float'
    end
  end
end
describe User, '·create' do
  describe 'create last name unsuccess' do
    it 'throws an error to create when last name is empty' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: '', email: 'c@x.com', age: 20,
          address: nil
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The last name is an empty'
    end
    it 'throws an error to create when last name is integer' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 9, email: 'qaw@m.com', age: 20,
          address: 'calle 7'
        )
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a integer'
    end
    it 'throws an error to create when last name is float' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 9.4, email: 'qrt@g.com', age: 20,
          address: 'calle 7'
        )
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a float'
    end
  end
end
describe User, '·create' do
  describe 'create age unsuccess' do
    it 'throws an error to create when age is string' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Munoz', email: 'sa@gil.com',
          age: 'sam', address: 'calle 7'
        )
      }.must_raise(StringError)
      err.message.must_match 'The age is string'
    end
    it 'throws an error to create when age is float' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Munoz', email: 'san@gml.com',
          age: 2.3, address: 'calle 7'
        )
      }.must_raise(NumberError)
      err.message.must_match 'The age is a float'
    end
    it 'throws an error to create when age is negative' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Munoz', email: 'ssn@gil.com',
          age: -2, address: 'calle 7'
        )
      }.must_raise(NumberError)
      err.message.must_match 'The age is negative'
    end
  end
end
describe User, '·create' do
  describe 'create email unsuccess' do
    it 'throws an error to create when email is empty' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Munoz', email: '',
          age: 20, address: 'calle 7'
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The email is an empty'
    end
    it 'throws an error to create when email does not have the structure' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Munoz', email: 'saagmail',
          age: 20, address: 'calle 7'
        )
      }.must_raise(EmailError)
      err.message.must_match 'Email is invalid'
    end
    it 'throws an error to create when email already exists' do
      User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'p@gail.com',
        age: 18, address: 'calle 7'
      )
      err = lambda {
        User.new(
          first_name: 'Samira', last_name: 'Munoz',email: 'p@gail.com',
          age: 20,address: 'calle 7'
        ).create
      }.must_raise(EmailError)
      err.message.must_match 'Email already exists'
    end
  end
end
describe User, '·create' do
  describe 'create email unsuccess' do
    it 'throws an error to create when address is float' do
      err = lambda {
        User.create(
          first_name: 'Samira', last_name: 'Muñoz', email: 'gr@ui.com',
          age: 20, address: -2.3
        )
      }.must_raise(NumberError)
      err.message.must_match 'The address is a float'
    end
  end
end
describe User, '·count' do
  describe 'the success' do
    it 'alls the users' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'gu@pui.com',
        age: 20, address: nil
      )
      User.count.must_be :<=, user.id_autoincrease.last
    end
  end
end
describe User, '·all' do
  describe 'the success' do
    it 'alls the users' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'gu@ui.com',
        age: 20, address: nil
      )
      User.all.must_include(user)
    end
  end
end
describe User, '·find' do
  describe 'the success' do
    it 'finds the users' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'gy@ui.com',
        age: 20, address: nil
      )
      User.find(user.id).must_be_same_as(user)
    end
  end
  describe 'the unsuccess' do
    it 'throws an error when the find id does not exist' do
      err = lambda {
        User.find(400)
      }.must_raise
      err.message.must_match 'Record not found'
    end
  end
end
describe User, '·where' do
  describe 'the success' do
    it 'searches where the first name is typed' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'aqua2@gmail.com',
        age: 18, address: nil
      )
      User.where(
        first_name: 'Samira'
      ).must_include(user)
    end
    it 'searches where the last name is typed' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'am@gl.com',
        age: 20, address: nil
      )
      User.where(
        last_name: 'Munoz'
      ).must_include(user)
    end
    it 'searches where the email is typed' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'aquama@gmail.com',
        age: 58, address: nil
      )
      User.where(
        email: 'aquama@gmail.com'
      ).must_include(user)
    end
    it 'searches where the age is typed' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'a10@gmail.com',
        age: 15, address: nil
      )
      User.where(
        age: 15
      ).must_include(user)
    end
    it 'searches where the address is typed' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'a99@g.com',
        age: 15, address: 'Calle 7'
      )
      User.where(
        address: 'Calle 7'
      ).must_include(user)
    end
  end
end
describe User, '#update' do
  describe 'the success' do
    it 'updates user based on the find id' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'mun@gmail.com',
        age: 18, address: 'calle 7'
      ).create
      user.update(
        last_name: 'Piza'
      )
      update = 'Piza'
      user.hash[:last_name].must_be :==, update
    end
  end
end
describe User, '#update' do
  describe 'the success' do
    it 'updates user based on the find id' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'xn@gmail.com',
        age: 18, addres: 'calle 7'
      ).create
      user.update(
        last_name: 'Piza'
      )
      update = 'Piza'
      user.hash[:last_name].must_be :==, update
    end
  end
end
describe User, '#update' do
  describe 'update first name unsuccess' do
    it 'throws an error to update when first name is empty' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'e@x.com',
        age: 10, address: nil
      )
      err = lambda {
        user.update(
          first_name: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The first name is an empty'
    end
    it 'throws an error to update when first name is integer' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'xa@m.com',
        age: 8, address: 'calle 7'
      )
      err = lambda {
        user.update(
          first_name: 9
        )
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a integer'
    end
    it 'throws an error to update when first name is float' do
      user = User.create(
        first_name: 'Samira', last_name: 'Muñoz', email: 'xi@gil.com', age: 10,
        address: nil
      )
      err = lambda {
        user.update(
          first_name: 9.4
        )
      }.must_raise(NumberError)
      err.message.must_match 'The first name is a float'
    end
  end
end
describe User, '#update' do
  describe 'update last name unsuccess' do
    it 'throws an error to update when last name is empty' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'f@m.com', age: 20,
        address: nil
      )
      err = lambda {
        user.update(
          last_name: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The last name is an empty'
    end
    it 'throws an error to update when last name is integer' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'fa@m.com', age: 20,
        address: 'calle 7'
      )
      err = lambda {
        user.update(
          last_name: 9
        )
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a integer'
    end
    it 'throws an error to update when last name is float' do
      user = User.create(
        first_name: 'Samira', last_name: 'Munoz', email: 'fi@g.com', age: 20,
        address: 'calle 7'
      )
      err = lambda {
        user.update(
          last_name: 9.4
        )
      }.must_raise(NumberError)
      err.message.must_match 'The last name is a float'
    end
  end
end
describe User, '#update' do
  describe 'update age unsuccess' do
    it 'throws an error to update when age is string' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'sky@gmail.com',
        age: 10, address: 'calle 7'
      ).create
      err = lambda {
        user.update(
          age: 'sam'
        )
      }.must_raise(StringError)
      err.message.must_match 'The age is string'
    end
    it 'throws an error to update when age is float' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'uy@gmail.com',
        age: 10, address: 'calle 7'
      ).create
      err = lambda {
        user.update(
          age: 2.3
        )
      }.must_raise(NumberError)
      err.message.must_match 'The age is a float'
    end
    it 'throws an error to update when age is negative' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'ux@gmail.com',
        age: 2, address: 'calle 7'
      ).create
      err = lambda {
        user.update(
          age: -2
        )
      }.must_raise(NumberError)
      err.message.must_match 'The age is negative'
    end
  end
end
describe User, '#update' do
  describe 'update email unsuccess' do
    it 'throws an error to update when email is empty' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'm@k.co',
        age: 20, address: 'calle 7'
      ).create
      err = lambda {
        user.update(
          email: ''
        )
      }.must_raise(EmptyError)
      err.message.must_match 'The email is an empty'
    end
    it 'throws an error to update when email does not have the structure' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'sami@ail.co',
        age: 20, address: 'calle 7'
      ).create
      err = lambda {
        user.update(
          email: 'samigmail'
        )
      }.must_raise(EmailError)
      err.message.must_match 'Email is invalid'
    end
  end
end
describe User, '#update' do 
  it 'throws an error to update when address is float' do
    user = User.new(
      first_name: 'Samira', last_name: 'Muñoz', email: '89@gmail.com',
      age: 20, address: nil
    ).create
    err = lambda {
      user.update(
        address: 4.2
      )
    }.must_raise(NumberError)
    err.message.must_match 'The address is a float'
  end
end
describe User, '#delete' do
  describe 'deletes user based on the find id' do
    it 'delete user' do
      user = User.new(
        first_name: 'Samira', last_name: 'Munoz', email: 'mmuno@gmail.com',
        age: 18, address: 'calle 7'
      ).create
      user.destroy.must_equal(true)
    end
  end
end
