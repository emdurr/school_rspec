FactoryGirl.define do
  factory :institution do
    name "devpoint"
    discipline "coding"
    founded "2013"
    accepting_applications true

    factory :institution_with_course do
    	after(:create) do |institution|
    		create(course, institution: institution)
    	end
    end
  end
end
