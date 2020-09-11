FactoryBot.define do
  factory :profile do
    content { "MyText" }
    language { "MyString" }
    github { "MyString" }
    user
  end
end
