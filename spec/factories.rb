FactoryGirl.define do
  factory :timeslot do
    start_time { 1411484400 }
    duration { 30 + rand(120) }
  end

  factory :boat do
    name { Faker::Name.name }
    capacity { 4 + rand(12) }
  end

  factory :billing do
    group_size { 2 + rand(6) }
    association :assignment
  end
end