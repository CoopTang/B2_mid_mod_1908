require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort_name }
    it { should validate_presence_of :age }
    it { should validate_numericality_of :age }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:instructors).through(:instructor_students) }
  end

  describe 'instance methods' do
    it '#average_age' do
      student_1 = Student.create(
        name: "Michael Cooper",
        cohort_name: "1908",
        age: 28
      )
      student_2 = Student.create(
        name: "Bob Joe",
        cohort_name: "1906",
        age: 40
      )
      expect(Student.all.average_age).to eq(34)
    end
  end
end