class Student < ApplicationRecord
  validates_presence_of :name,
                        :cohort_name,
                        :age
  validates_numericality_of :age

  has_many :instructor_students
  has_many :instructors, through: :instructor_students

  def self.average_age
    average(:age)
  end
end