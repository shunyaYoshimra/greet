FactoryBot.define do
  factory :profile do
    user { nil }
    content { "MyText" }
    language { "MyString" }
    github { "MyString" }
  end
end
