require 'spec_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should have_attached_file :picture }

  context '.search' do
    it 'will find all products that match a search' do
      test_product1 = Product.create(:name => "dog", :price => 12)
      test_product2 = Product.create(:name => "cat", :price => 14)
      Product.search("Cat").should eq [test_product2]
    end
    it 'will return no products if no matches are found' do
      test_product1 = Product.create(:name => "dog", :price => 12)
      test_product2 = Product.create(:name => "cat", :price => 14)
      Product.search("Cdgsfat").should eq false
    end
  end
end
