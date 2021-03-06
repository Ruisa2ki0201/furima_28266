require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能'
  context '商品出品がうまくいくとき' do
    it '全ての情報が存在していれば出品できる' do
      expect(@item).to be_valid
      binding.pry
    end
  end

  context '商品出品がうまくいかないとき' do

    it 'nameが空だと商品出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors[:name]).to include("を入力してください")
    end

    it 'textが空だと商品出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors[:text]).to include("を入力してください")
    end

    it 'priceが空だと商品出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors[:price]).to include("を入力してください")
    end

    it 'genre_idが空だと商品出品できない' do
      @item.genre_id = ''
      @item.valid?
      expect(@item.errors[:genre_id]).to include("を入力してください", "は数値で入力してください")
    end

    it 'status_idが空だと商品出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors[:status_id]).to include("を入力してください", "は数値で入力してください")
    end

    it 'bunder_idが空だと商品出品できない' do
      @item.bunder_id = ''
      @item.valid?
      expect(@item.errors[:bunder_id]).to include("を入力してください", "は数値で入力してください")
    end

    it 'shipment_idが空だと商品出品できない' do
      @item.shipment_id = ''
      @item.valid?
      expect(@item.errors[:shipment_id]).to include("を入力してください", "は数値で入力してください")
    end

    it 'area_idが空だと登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors[:area_id]).to include("を入力してください", "は数値で入力してください")
    end

  end
end
