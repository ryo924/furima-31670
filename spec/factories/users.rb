FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    sei {"あ"}
    mei {"あ"}
    sei_kana {"ア"}
    mei_kana {"ア"}
    birthday {Faker::Date.birthday}
  end
end