FactoryBot.define do

  factory :address do
    family_name              {"山田"}
    last_name                 {"太郎"}
    j_family_name              {"やまだ"}
    j_last_name {"たろう"}
    postal_code           {"0000000"}
    prefectures             {"東京都"}
    municipality         {"立川市"}
    number           {"1-1-1"}
    phone_number         {"0120500500"}

  end

end