require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  # test "the product should have name" do
  #   @product_new = Product.new()

  #   assert_not @product_new.save(), "Fallo la validación de datos en blanco"
  # end

  test "The index should show Products List title" do
    get products_path 

    assert_response :success
    assert_select "h1", "Products List"
  end

  test "Show message when not products registers" do
    Product.delete_all
    get products_path

    assert_response :success
    assert_select "p", "Products not registered"
  end

  # validamos que todos los campos esten llenos
  test "All fields should to filled" do
    product = Product.new(name:"Impresora Epson", price:1200, description:"Multifuncional")
    assert product.valid?
  end

  # validamos que el producto tenga nombre
  test "the product should have name" do
    product = Product.new(price:1200, description:"Multifuncional")
    assert_not product.valid?
  end

  # validamos que el producto tenga precioi
  test "the product shold have price" do
    producto = Product.new(name:"Impresora", description:"Multifuncional")
    assert_not producto.valid?
  end

  # validamos que el precio sea mayor a cero
  test "product price sholud greater than zero" do
    product = Product.new(name:"Impresora", price:0, description:"Multifuncional")
    product.valid?
    assert_includes product.errors[:price], "must be greater than 0"
  end

  # test "should get index" do
  #   #get products_url
  #   get products_path
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_product_url
  #   assert_response :success
  # end

  # test "should create product" do
  #   assert_difference("Product.count") do
  #     post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price } }
  #   end

  #   assert_redirected_to product_url(Product.last)
  # end

  # test "should show product" do
  #   get product_url(@product)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_product_url(@product)
  #   assert_response :success
  # end

  # test "should update product" do
  #   patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price } }
  #   assert_redirected_to product_url(@product)
  # end

  # test "should destroy product" do
  #   assert_difference("Product.count", -1) do
  #     delete product_url(@product)
  #   end

  #   assert_redirected_to products_url
  # end
end
