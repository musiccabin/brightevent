FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    date { "2019-08-09" }
    where { "MyString" }
    img_url { "MyString" }
    user { nil }
  end
end
