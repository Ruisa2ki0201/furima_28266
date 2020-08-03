FactoryBot.define do
  

  factory :user do
    
    nickname                   {"ヤマダ"}
    email                      {"test@com"}
    password                   {"aaa000"}
    password_confirmation      {password}
    birthday                   {2000-02-01}
    surname                    {"山田"}
    name                       {"太郎"}
    phonetic_surname           {"ヤマダ"}
    phonetic_name              {"タロウ"}
  end
end