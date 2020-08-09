FactoryBot.define do
  factory :address do
    postal_cod          {"123-4567"}
    shipment_id         { 3 } 
    cities              {"横浜市緑区"}
    address             {"青山1-1"}
    build_name          {"柳ビル103"}
    phone_number        {"09012345678"}              
  end
end