FactoryGirl.define do
  factory :customer do
    sequence(:first_name)  { |n| "Person #{n}" }
    sequence(:last_name) { |n| "person_#{n} last"}

  end

  factory :charge do
  	sequence(:created)  { 10000}
    sequence(:paid) { true}
    sequence(:amount) {8500}
    sequence(:currency) { 'USD'}
    sequence(:refunded) {false}
    customer
  end
end
