class User
  def initialize(first_name, last_name, birthday)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
  end

  attr_accessor :first_name, :last_name, :birthday
end

class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    year, month, day = birthday.split('/')
    birthday = Time.new(year, month, day, "+03:00")
    ((Time.now - birthday) / 31557600).floor
  end
end

user = User.new('Jessica', 'Chaves', '1991/3/29')

user_decorator = UserDecorator.new(user)

puts user_decorator.full_name
puts user_decorator.age
