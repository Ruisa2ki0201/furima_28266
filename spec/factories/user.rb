FactoryBot.define do
  factory :user do
    nickname                   { 'ヤマダ' }
    email                      { 'test@com' }
    password                   { 'aaa000' }
    password_confirmation      { password }
    birthday                   { Date.new(2000, 2, 1) }
    surname                    { '山田' }
    name                       { '太郎' }
    phonetic_surname           { 'ヤマダ' }
    phonetic_name              { 'タロウ' }
  end
end
