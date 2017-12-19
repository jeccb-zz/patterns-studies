class Burger
  def initialize(cost)
    @cost = cost
  end
  attr_accessor :cost
end

class BurgerDecorator < SimpleDelegator
  def cheese_burger
    cost + 10
  end

  def large_burger
    cost + 15
  end
end

burger = Burger.new(50)
burger_decorator = BurgerDecorator.new(burger)
puts burger_decorator.cheese_burger
