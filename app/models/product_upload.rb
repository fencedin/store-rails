class ProductUpload

  def initialize(file)
    @file = file
  end

  def parse!
    product_attributes = SmarterCSV.process(@file)
    rescue EOFError
    product_attributes.each do |product_attribute|
      Product.create(product_attribute)
    end
  end
end
