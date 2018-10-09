FactoryBot.define do
  factory :post do
    project_id { 1 }
    user_id { 1 }
    comment { "MyString" }
  end
end
