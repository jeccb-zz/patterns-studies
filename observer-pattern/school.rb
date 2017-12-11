class Teacher
  def update(activity)
    puts("The test of #{activity.course} will be on #{activity.date}")
  end
end

class Student
  def update(activity)
    puts("I need study to the test of #{activity.course}.")
  end
end

module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class ScheduleTest
  include Subject

  attr_reader :course
  attr_accessor :date

  def initialize(course, date)
    super()
    @course = course
    @date = date
  end

  def date=(schedule_date)
    @date = schedule_date
    notify_observers
  end
end

schedule = ScheduleTest.new("Math", "December, 20")

teacher = Teacher.new
schedule.add_observer(teacher)

student = Student.new
schedule.add_observer(student)

schedule.date = "December 15"
