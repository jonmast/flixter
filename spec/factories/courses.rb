FactoryGirl.define do
  factory :course do
    title 'Super cool course'
    description "You won't believe how cool this course is!"
    cost '9.99'
    user
  end
end
