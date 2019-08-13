require_relative 'user_validation.rb'
class NotFound < StandardError; end
# CRUD users
class User
  include Validation

  attr_accessor :hash
  attr_reader :id
  $users = []
  @@last_id = 0
  def initialize(hash)
    @id = nil
    @hash = hash
  end
  class << self
    def create(hash)
      user_new = new(hash)
      return if user_new.email_unique? || user_new.validation_create(user_new)

      user_new.id_autoincrease
      $users << user_new
      user_new
    end

    def users_empty?
      raise NotFound, 'No users yet' if $users.empty?
    end

    def all
      return if users_empty?

      $users
    end

    def count
      return if users_empty?

      $users.count
    end

    def find(id)
      user_find = $users.find { |user| user.id == id.to_i }
      user_find.nil? ? (raise NotFound, 'Record not found') : user_find
    end

    def where_hash(hash)
      k = []
      user_find = []
      hash.each_key { |key| k << key if key != :id }
      $users.each do |user|
        (0...k.length).each do |i|
          user_find << user if user.hash[k[i]] == hash[k[i]]
        end
      end
      user_find
    end

    def where(hash)
      users_where = []
      users_where << find(hash[:id]) if hash.key?(:id) # => User
      users_where << where_hash(hash) # => [], [User, User]
      users_where.flatten
      # [User, []], [User, [User, User]] => [User, User, ...]
    end
  end

  def id_autoincrease
    @@last_id = @last_id + 1
    @id = @@last_id
  end

  def create
    return if email_unique?(@email) || validation_create(self)

    id_autoincrease
    $users << self
    self
  end

  def email_unique?(*)
    email_unique = false
    email_find = $users.find { |user| user.hash[:email] == hash[:email] }
    email_find.nil? ? email_unique : (raise EmailError, 'Email already exists')
  end

  def update(hash)
    return false if validation_update(hash)

    hash.delete(:id)
    hash.each_key do |key|
      self.hash[key] = hash[key]
    end
    self
  end

  def destroy
    return true if $users.delete(self)
  end
end
