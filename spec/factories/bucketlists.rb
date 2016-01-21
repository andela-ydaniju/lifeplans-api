FactoryGirl.define do
  factory :bucketlist do
    title Faker::Hipster.word
    description Faker::Hipster.sentence
  end
end
