class Payroll
  def update(changed_employee)
		puts("I cut a check for #{changed_employee.name}")
		puts("His salary is now #{changed_employee.salary}")
	end
end

class TaxMan
	def update(changed_employee)
		puts("I will send a new invoice to #{changed_employee.name}")
	end
end

module Subject
	def initialize
		@observers = []
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end
end


class Employee
	include Subject

	attr_reader :name, :title
	attr_accessor :salary

	def initialize(name, title, salary)
		super()
		@name = name
		@title = title
		@salary = salary
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end
end


fred = Employee.new("Fred", "Crane Operator", 30000.0)

payroll = Payroll.new
fred.add_observer(payroll)

taxman = TaxMan.new
fred.add_observer(taxman)

fred.salary = 35000.0
