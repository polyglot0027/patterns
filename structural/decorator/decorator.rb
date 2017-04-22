class User
  attr_accessor :first_name, :last_name, :birthday

  def initialize(first_name:, last_name:, birthday:)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
  end

end

class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    # 60 * 60 * 24 * 365.25 is 31557600
    # 31557600 is one year in seconds
    ((Time.now - birthday) / 31557600).floor
  end
end

user = User.new(
  first_name: "Bogdan",
  last_name: "Denkovych",
  birthday: Time.new(1996, 6, 27, 6, 0, "+03:00")
)

user_decorator = UserDecorator.new(user)

user_decorator.class # => UserDecorator
user_decorator.first_name # => "Bogdan"
user_decorator.last_name # => "Denkovych"
user_decorator.full_name # => "Bogdan Denkovych"
user_decorator.birthday # => 1996-06-27 06:00:00 +0300
user_decorator.age # => 20
