# frozen_string_literal: true

# spec/factories/todos.rb
FactoryBot.define do
  factory :defendant do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday }

    factory :representation_order do
      maat_reference { Faker::Number.number(7) }
    end
  end
end
