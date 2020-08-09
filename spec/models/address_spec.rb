require 'rails_helper'

describe Address do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @addres = FactoryBot.build(:address, item_id: @item.id)
  end
  
  describe '商品購入機能'
  context '商品購入がうまくいくとき' do
    it '全ての情報が存在していれば出品できる' do
      expect(@addres).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'postal_codが空だと購入できない' do
      @addres.postal_cod = ""
      @addres.valid?
      expect(@addres.errors[:postal_cod]).to include("can't be blank")
    end

    it 'postal_codは-を含む7桁でないと購入できない' do
      @addres.postal_cod = "000000"
      @addres.valid?
      expect(@addres.errors[:postal_cod]).to include("は-を含む7桁で入力してください")
    end

    it 'shipment_idが空だと購入できない' do
      @addres.shipment_id = ""
      @addres.valid?
      expect(@addres.errors[:shipment_id]).to include("can't be blank")
    end

    it 'citiesが空だと購入できない' do
      @addres.cities = ""
      @addres.valid?
      expect(@addres.errors[:cities]).to include("can't be blank")
    end

    it 'addressが空だと購入できない' do
      @addres.address = ""
      @addres.valid?
      expect(@addres.errors[:address]).to include("can't be blank")
    end

    it 'build_nameが空だと購入できない' do
      @addres.build_name = ""
      @addres.valid?
      expect(@addres.errors[:build_name]).to include("can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @addres.phone_number = ""
      @addres.valid?
      expect(@addres.errors[:phone_number]).to include("can't be blank")
    end

    it 'phone_numberは11桁で入力しないと登録できない' do
      @addres.phone_number = "0000000000"
      @addres.valid?
      expect(@addres.errors[:phone_number]).to include("は11桁で入力してください")
    end
  end
end
