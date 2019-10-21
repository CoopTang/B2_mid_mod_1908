require 'rails_helper'

RSpec.describe 'Instructor Show Page', type: :feature do
  describe 'When I click on an instructor link in the student index' do
    it 'displays the instructor name, all their students, and the average age of students' do
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

      student_2.instructors << instructor_1

      visit '/students'

      within "#student-#{student_1.id}" do
        click_link 'Meg'
      end

      expect(current_path).to eq("/instructors/#{instructor_1.id}")
      expect(page).to have_content("Meg")
      expect(page).to have_content("Students:\nMichael Cooper\nBob Joe")
      expect(page).to have_content("Average Student Age: 34")
    end
  end
end
