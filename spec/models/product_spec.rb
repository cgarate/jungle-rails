require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:context) do
    @cat = Category.find_or_create_by! name: 'Apparel'
  end

  describe 'Validations' do

    it "validates a product will be created" do
      @product = @cat.products.create!({ name: 'Hipster Fake Beard', quantity: 10, price: 64.99 })
      expect(@product).to be
    end

    it "validates the presence of name" do
      @product = @cat.products.create({ quantity: 10, price: 64.99 })
      expect(@product.name).not_to be_nil
    end

    it "validates the presence of price" do
      @product = @cat.products.create({ name: 'Hipster Fake Beard', quantity: 10 })
      expect(@product.price).not_to be_nil
    end

    it "validates the presence of quantity" do
      @product = @cat.products.create!({ name: 'Hipster Fake Beard', price: 64.99 })
      expect(@product.quantity).not_to be_nil
    end

    it "validates the presence of category" do
      @product = @cat.products.create!({ name: 'Hipster Fake Beard', quantity: 10, price: 64.99 })
      expect(@product.category_id).not_to be_nil
    end


  end
end
