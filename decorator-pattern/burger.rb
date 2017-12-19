class Burger
  def cost
    50
  end
end

module CheeseBurger
  def cost
    super + 10
  end
end

module LargeBurger
  def cost
    super + 15
  end
end

burger = Burger.new
burger.extend(CheeseBurger)
burger.extend(LargeBurger)
puts burger.cost
