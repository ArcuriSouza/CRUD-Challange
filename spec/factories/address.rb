FactoryBot.define do
  factory :address do
    street { 'Rua dos Bandeirantes' }
    city { 'São Paulo' }
    state { 'SP' }
    postal_code { 96050380 }
    country { 'Brasil' }
    person

    trait :all_blank do
      street { nil }
      city { nil }
      state { nil }
      postal_code { nil }
      country { nil }
    end
  end
end
