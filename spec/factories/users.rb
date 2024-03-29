# frozen_string_literal: true

# spec/factories/defendants.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
  end
end
