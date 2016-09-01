FactoryGirl.define do
  factory :course do
    title "ruby on rails"
    number "2100"
    description "An immersive approach to learning to code using ruby on rails language and framework"
    day_of_the_week "M"
    time_of_day "9:30 - 5:30"
    institution_id "@institution_id"
  end
end
