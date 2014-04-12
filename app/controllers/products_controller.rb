class ProductsController < ApplicationController
  def index
    if params[:search].nil?
      @products = Product.all
    elsif Product.search(params[:search]) == false
      params[:search] = nil
      @products = Product.all
      redirect_to '/', alert: "No matches found!"
    else
      @products = Product.search(params[:search])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "#{@product.name} has been added."
    else
      flash[:alert] = "Too bad. Try again."
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "#{@product.name} has been updated."
    else
      flash[:alert] = "Too bad. Try again."
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :root
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :picture)
  end

end
