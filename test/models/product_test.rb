require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Sample Product", price: 10)
  end

  test "should be valid with valid attributes" do
    assert @product.valid?
  end

  test "should be invalid without a name" do
    @product.name = nil
    assert_not @product.valid?
  end

  test "should be invalid without a price" do
    @product.price = nil
    assert_not @product.valid?
  end

  test "should be invalid with a non-numerical price" do
    @product.price = "abc"
    assert_not @product.valid?
  end

  test "should be invalid with a price less than or equal to zero" do
    @product.price = 0
    assert_not @product.valid?
  end

  # test "should return 'Vencido' if entrada is 0" do
  #   assert_equal "Vencido", Product.vencido(0)
  # end

  # test "should return 'Vigente' if entrada is not 0" do
  #   assert_equal "Vigente", Product.vencido(1)
    
  # end
end
