require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品を出品できる時' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it 'item_describeが空では登録できない' do
        @item.item_describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item describe can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'category_idに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'condition_idに「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition must be other than 1")
      end
      it 'send_cost_idが空では登録できない' do
        @item.send_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Send cost can't be blank")
      end
      it 'send_cost_idに「---」が選択されている場合は出品できない' do
        @item.send_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Send cost must be other than 1")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'prefecture_idに「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture must be other than 1")
      end
      it 'arrive_day_idが空では登録できない' do
        @item.arrive_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Arrive day can't be blank")
      end
      it 'arrive_day_idに「---」が選択されている場合は出品できない' do
        @item.arrive_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Arrive day must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '価格の範囲が¥300~¥9,999,999の間でないと商品を登録できない' do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it '価格が299円以下だと出品できない' do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it '価格が10000000円以上だと出品できない' do
        @item.price = "11111111"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it '価格は半角数字でないと商品は出品できない' do
        @item.price = "ぷらいす"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end