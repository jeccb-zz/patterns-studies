# Strategy Pattern - When to Consider the Pattern
# There are a number of scenarios where the Strategy pattern is worth considering:
#  - The only difference between related classes is behavior.
#  - Behavior can be defined at runtime.
#  - You find yourself using conditional statements to do “type checking”.
#  - You want to get rid of hard-coded dependencies.

class Employe
  attr_reader :hiring_type

  def initialize(hiring_type)
    @hiring_type = hiring_type
    @salary = 2000
  end

  def receive
    hiring_type.discount(@salary)
  end
end

class PJ
  def discount(salary)
    salary / 100 * 5
  end
end

class CLT
  def discount(salary)
    salary / 100 * 30
  end
end

employe = Employe.new(PJ.new)
employe.receive
puts "To #{employe.hiring_type.class} will recieve #{employe.receive}"

employe = Employe.new(CLT.new)
employe.receive
puts "To #{employe.hiring_type.class} will recieve #{employe.receive}"
