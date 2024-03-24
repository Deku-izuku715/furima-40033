require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  context '購入できる場合' do
    it "すべての情報があれば購入できる" do
      expect(@order_form).to be_valid
    end
    it 'construction_nameは空でも保存できること' do
      @order_form.construction_name = ''
      expect(@order_form).to be_valid
    end
  end
  context '購入できない場合' do
    it "tokenが空では保存できない" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が必須であること' do
      @order_form.post_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
    end
    it '郵便番号は、「３桁ハイフン４桁」の半角文字列のみ保存可能なこと' do
      @order_form.post_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '都道府県が必須であること' do
      @order_form.prefecture_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須であること' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が必須であること' do
      @order_form.street_address = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street address can't be blank")
    end
    it '電話番号が必須であること' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_form.phone_number = '123456789876'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid.")
    end
  end
end
