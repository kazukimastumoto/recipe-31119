require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  it '画像がなければ投稿できない' do
    @recipe.image = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include "Image translation missing: ja.activerecord.errors.models.recipe.attributes.image.blank"
  end

  it "金額が入力されていなければ投稿できない" do
    @recipe.price = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include "Price translation missing: ja.activerecord.errors.models.recipe.attributes.price.blank"
  end

  it "titleが入力されていなければ投稿できない" do
    @recipe.title = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include "Title translation missing: ja.activerecord.errors.models.recipe.attributes.title.blank"
  end

  it "materialが入力されていなければ投稿できない" do
    @recipe.material = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include "Material translation missing: ja.activerecord.errors.models.recipe.attributes.material.blank"
  end

  it "bodyが入力されていなければ投稿できない" do
    @recipe.body = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include "Body translation missing: ja.activerecord.errors.models.recipe.attributes.body.blank"
  end

  it "全ての情報があれば投稿できる" do
    expect(@recipe).to be_valid
  end

end
