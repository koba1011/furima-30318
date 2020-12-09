FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end