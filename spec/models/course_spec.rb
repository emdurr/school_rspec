require 'rails_helper'

RSpec.describe Course, type: :model do
	

	describe "validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:number) }
		it { should validate_presence_of(:day_of_the_week) }
		it { should validate_presence_of(:time_of_day) }
		it { should belong_to(:institution) }
	end
	
	describe "title_day" do
		before(:each) do 
			@institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
		end

		it "returns string" do
			course = Course.create(title: 'ruby on rails',
																					description: 'A course about ruby',
																					number: '2100',
																					day_of_the_week: 'M, T, W, Th, F',
																					time_of_day: '9:30 - 5:30',
																					institution_id: @institution.id)
			expect(course.title_day).to eq("ruby on rails is held on M, T, W, Th, F")
		end

		it 'checks variable existence' do
			course = Course.create(title: 'ruby on rails',
																					description: 'A course about ruby',
																					number: '2100',
																					day_of_the_week: 'M, T, W, Th, F',
																					time_of_day: '9:30 - 5:30',
																					institution_id: @institution.id)
			expect(course.title).to eq("#{course.title}")
			expect(course.day_of_the_week).to eq("#{course.day_of_the_week}")
		end
	end

	describe ".by_title" do
		before(:each) do 
			@institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
		end
		it 'orders the course by title' do
			c1 = Course.create(title: 'ruby on rails',
	 											 description: 'A course about ruby',
	 											 number: '2100',
	 											 day_of_the_week: 'M, T, W, Th, F',
	 											 time_of_day: '9:30 - 5:30',
	 											 institution_id: @institution.id
	 											 )
			c2 = Course.create(title: 'javascript',
	 											 description: 'A course about javascript',
	 											 number: '1100',
	 											 day_of_the_week: 'M, T, W, Th',
	 											 time_of_day: '6:00 - 7:30',
	 											 institution_id: @institution.id
	 											 )
			c3 = Course.create(title: 'front end design',
	 											 description: 'A course about html and css',
	 											 number: '1500',
	 											 day_of_the_week: 'M, T, W, Th',
	 											 time_of_day: '8:00 - 9:30',
	 											 institution_id: @institution.id
	 											 )
			c4 = Course.create(title: 'Python',
	 											 description: 'A course about Python',
	 											 number: '1000',
	 											 day_of_the_week: 'M, T, W, Th, F',
	 											 time_of_day: '10:00 - 11:30',
	 											 institution_id: @institution.id
	 											 )
			ordered_courses = Course.all.by_title
			expect(ordered_courses.first.title).to eq('front end design')
			expect(ordered_courses.last.title).to eq('ruby on rails')
		end
	end

	describe ".by_number" do
		before(:each) do 
			@institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
		end
		it 'orders the course by number' do
			c1 = Course.create(title: 'ruby on rails',
	 											 description: 'A course about ruby',
	 											 number: '2100',
	 											 day_of_the_week: 'M, T, W, Th, F',
	 											 time_of_day: '9:30 - 5:30',
	 											 institution_id: @institution.id
	 											 )
			c2 = Course.create(title: 'javascript',
	 											 description: 'A course about javascript',
	 											 number: '1100',
	 											 day_of_the_week: 'M, T, W, Th',
	 											 time_of_day: '6:00 - 7:30',
	 											 institution_id: @institution.id
	 											 )
			c3 = Course.create(title: 'front end design',
	 											 description: 'A course about html and css',
	 											 number: '1500',
	 											 day_of_the_week: 'M, T, W, Th',
	 											 time_of_day: '8:00 - 9:30',
	 											 institution_id: @institution.id
	 											 )
			c4 = Course.create(title: 'Python',
	 											 description: 'A course about Python',
	 											 number: '1000',
	 											 day_of_the_week: 'M, T, W, Th, F',
	 											 time_of_day: '10:00 - 11:30',
	 											 institution_id: @institution.id
	 											 )
			ordered_courses = Course.all.by_number
			expect(ordered_courses.first.title).to eq('Python')
			expect(ordered_courses.last.title).to eq('ruby on rails')
		end
	end
end
