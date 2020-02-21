FactoryBot.define do

  factory :item do
    name                  {"aaa"}
    price                 {300}
    item_text             {"gooditem"}
    address               {"10"}
    date                  {"1/1"}
    brand                 {"rrr"}
    status                {"good"}
    delivery_charge       {500}
    size                  {"L"}
    sold_out              {0}
    user_id               {1}
    category_id           {1}
  end

end