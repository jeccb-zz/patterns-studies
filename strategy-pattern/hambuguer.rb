class Hamburguer
  attr_reader :kind

  def initialize(kind)
    @kind = kind
  end

  def build
    kind.ingredients
  end
end

class Chicken
  def ingredients
    "bread, chicken, lettuce, tomato"
  end
end

class Standard
  def ingredients
    "bread, meat, lettuce, tomato"
  end
end

hamburguer = Hamburguer.new(Chicken.new)
puts "If the kind was #{hamburguer.kind.class} the ingredients are: #{hamburguer.build}"

hamburguer = Hamburguer.new(Standard.new)
puts "If the kind was #{hamburguer.kind.class} the ingredients are: #{hamburguer.build}"
