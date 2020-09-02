require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/sample.png')
  end

  describe '出品登録' do
    context "出品できる" do
      it "全ての情報が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "出品できない" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category select")
      end
      it "status_idが空だと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status select")
      end
      it "postage_idが空だと出品できない" do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage select")
      end
      it "prefectures_idが空だと出品できない" do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures select")
      end
      it "days_idが空だと出品できない" do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days select")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが300以下だと出品できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが10000000以下だと出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
