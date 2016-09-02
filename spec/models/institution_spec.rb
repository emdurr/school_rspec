require 'rails_helper'

RSpec.describe Institution, type: :model do
	describe "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:discipline) }
		it { should validate_presence_of(:founded) }
		it { should have_many(:courses) }
	end

	describe "#name_founded" do
		before(:each) do
			@institution = FactoryGirl.create(:institution)
		end
		it "returns string" do	
			expect(@institution.name_founded).to eq("#{@institution.name} was founded #{@institution.founded}")
		end

		it "checks variables" do
			expect(@institution.name).to eq("#{@institution.name}")
			expect(@institution.founded).to eq("#{@institution.founded}")
		end
	end

	describe "#founded_date" do
		it 'returns Ancient if founded date before 1500' do
			institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '1499')
			expect(institution.founded_date).to eq('Ancient')
		end

		it 'returns Old if founded date before 1900' do
			institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '1599')
			expect(institution.founded_date).to eq('Old')
		end

		it 'returns New if founded date after 1900' do
			institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
			expect(institution.founded_date).to eq('New')
		end
	end

	describe ".by_name" do
		it 'orders the institutions by name' do
			i1 = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
			i2 = Institution.create(name: 'USU', discipline: 'agriculture', founded: '1599')
			i3 = Institution.create(name: 'Weber State', discipline: 'stuff', founded: '1800')
			i4 = Institution.create(name: 'BYU', discipline: 'everything', founded: '1914')
			ordered_inst = Institution.all.by_name
			expect(ordered_inst.first.name).to eq('BYU')
			expect(ordered_inst.last.name).to eq('Weber State')
		end
	end

	describe ".by_founded" do
		it 'orders the institutions by founded date' do
			i1 = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
			i2 = Institution.create(name: 'USU', discipline: 'agriculture', founded: '1599')
			i3 = Institution.create(name: 'Weber State', discipline: 'stuff', founded: '1800')
			i4 = Institution.create(name: 'BYU', discipline: 'everything', founded: '1914')
			ordered_inst = Institution.all.by_founded
			expect(ordered_inst.first.name).to eq('USU')
			expect(ordered_inst.last.name).to eq('devpoint')
		end
	end
end
