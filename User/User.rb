require_relative 'User_validation.rb'
class NotFound < StandardError; end
# CRUD users
class User
  attr_accessor :hash
  attr_reader :id
  include Validation
  extend Validation
  $users = []
  def initialize(hash)
    @id ||= nil
    @hash = hash
  end
  class << self
    def create(hash)
      user_new = new(@hash = hash)
      user_new.id_autoincrease
      return if user_new.email_unique? || validation_create(user_new.itself)

      $users << user_new
    end

    def all
      $users
    end

    def count
      $users.count
    end

    def find(id)
      user_find = $users.find { |user| user.id == id.to_i }
      user_find.nil? ? (raise 'Record not found') : user_find
    end

    def where_hash(hash)
      k = []
      user_find = []
      hash.each_key { |key| k << key if key != :id }
      index = k.length
      $users.each do |user|
        (0...index).each do |i|
          user_find << user if user.hash[k[i]] == hash[k[i]]
        end
      end
    end

    def where(hash)
      users_where = []
      users_where << find(hash[:id]) if hash.key?(:id)
      users_where << where_hash(hash)
    end
  end

  def id_autoincrease
    @id = $users.size + 1
  end

  def create
    return if email_unique?(@email) || validation_create(self)

    id_autoincrease
    $users << self
  end

  def email_unique?(*)
    email_unique = false
    email_find = $users.find { |user| user.hash[:email] == hash[:email] }
    email_find.nil? ? email_unique : (raise 'Email already exists')
  end

  def update(hash)
    return if validation_update(hash)

    k = []
    hash.each_key { |key| k << key if key != :id }
    index = k.length
    (0...index).each do |i|
      self.hash[k[i]] = hash[k[i]]
    end
    $users
  end

  def destroy
    $users.delete(self)
    $users
  end
end
