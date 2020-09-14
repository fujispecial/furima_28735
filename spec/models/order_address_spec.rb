require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context "購入できる" do
      it "全ての情報が存在すれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "buildingが空でも購入できる" do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context "購入できない" do
      it "tokenがないと購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入できない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeはハイフンがないと購入できない" do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "prefecture_idが空だと購入できない" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture select")
      end
      it "cityがないと購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressがないと購入できない" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "telがないと購入できない" do
        @order_address.tel = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
    end
  end
end
