FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"山田"}
    last_name             {"太郎"}
    j_family_name         {"やまだ"}
    j_last_name           {"たろう"}
    birthday_year         {"1990"}
    birthday_month         {"4"}
    birthday_day         {"18"}    
  end

end