FactoryBot.define do
  sequence :title do |n|
    "Title_#{n}"
  end
  sequence :author do |n|
    "Author_#{n}"
  end

  factory :book do
    title
    body { 'description' }
    author

    trait :nil_body do
      body { nil }
    end
  end
end
