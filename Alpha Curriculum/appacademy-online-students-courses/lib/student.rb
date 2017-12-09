# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.

class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first_name,last_name)
    @first_name=first_name
    @last_name=last_name
    @courses=[]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(new_course)
    raise "This course conflicts with another enrolled class!" if student_conflict?(new_course)
    courses << new_course unless courses.include?(new_course)
    new_course.students << self
  end

  def student_conflict?(new_course)
    courses.each do |course|
      return true if new_course.conflicts_with?(course)
    end
    false
  end

  def course_load
    credits_taken=Hash.new(0)
    courses.each do |course|
      credits_taken[course.department]+=course.credits
    end
    credits_taken
  end
end
