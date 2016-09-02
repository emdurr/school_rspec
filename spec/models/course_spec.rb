require 'rails_helper'

RSpec.describe Course, type: :model do
	let(:institution) { FactoryGirl.create :institution}
  let(:course) { FactoryGirl.create :course, institution_id: institution.id }
  let(:multiple_courses) { FactoryGirl.create_list :course, 4, institution_id: institution.id }
  before(:each) do 
  	institution
  	course
  	multiple_courses
  end

	describe "validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:number) }
		it { should validate_presence_of(:day_of_the_week) }
		it { should validate_presence_of(:time_of_day) }
		it { should belong_to(:institution) }
	end
	
	describe "title_day" do
		it "returns string" do
			expect(course.title_day).to eq("ruby on rails is held on M")
		end

		it 'checks variable existence' do
			expect(course.title).to eq("ruby on rails")
			expect(course.day_of_the_week).to eq("#{'M'}")
		end
	end

	describe ".by_title" do
		it 'orders the course by title' do
			ordered_courses = Course.all.by_title
			expect(ordered_courses.first.title).to eq('ruby on rails')
			expect(ordered_courses.last.title).to eq('ruby on rails')
		end
	end

	describe ".by_number" do
		it "orders the course by number" do
			ordered_courses = Course.all.by_number
			expect(ordered_courses.first.title).to eq('ruby on rails')
			expect(ordered_courses.last.title).to eq('ruby on rails')
		end
	end
end
