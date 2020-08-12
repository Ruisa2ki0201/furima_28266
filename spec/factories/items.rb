FactoryBot.define do
  factory :item do
    name          { 'オーキド' }
    text          { 'オーキドの身柄' }
    price         { 3000 }
    genre
    status
    bunder
    shipment
    area
    user
    image      {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/images/81FZfXeV2QL.jpg'))} #画像のパス
  end
end
