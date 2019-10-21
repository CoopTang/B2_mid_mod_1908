require 'rails_helper'

# As a user,
# When I visit '/students'
# Then I see each student in the system including the student's:
#   - name
#   - cohort name (1906, 1808, etc.)
#   - the name of each instructor that they have

RSpec.describe 'Student Index', type: :feature do
  describe 'When I visit /students' do
    it 'I can see all studnets in the system and their info' do
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
      
      instructor_1 = Instructor.create(name: "Meg")
      instructor_2 = Instructor.create(name: "Mike")

      student_1.instructors << instructor_1
      student_1.instructors << instructor_2

      student_2.instructors << instructor_2

      visit '/students'

      within "#student-#{student_1.id}" do
        expect(page).to have_content("Name: Michael Cooper")
        expect(page).to have_content("Cohort: 1908")
        expect(page).to have_content("Instructors:\nMeg\nMike")
      end

      within "#student-#{student_2.id}" do
        expect(page).to have_content("Name: Bob Joe")
        expect(page).to have_content("Cohort: 1906")
        expect(page).to have_content("Instructors:\nMike")
      end
    end
  end
end