FactoryBot.define do
  factory :person do
    name { 'John Doe' }
    email { 'john.doe@example.com' }
    phone { '(11) 91111-1111' }
    birthdate { '2000-09-20' }

    trait :with_address do
      after(:build) do |person|
        person.address = build(:address)
      end
    end

    trait :with_build_address do
      after(:build) do |person|
        person.build_address
      end
    end

    trait :with_invalid_address do
      after(:build) do |person|
        person.address = build(:address, street: nil)
      end
    end
  end
end
