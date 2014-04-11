class ProductUploadsController < ApplicationController
  def new
    @product_upload = ProductUpload.new(params)
  end

  def create
    @product_upload = ProductUpload.new(params[:csv].tempfile).parse!
    @product_upload.each do |product|
      saved_product = Product.create(product)
    end
    redirect_to products_path, notice: "YAY!"
  end
end
