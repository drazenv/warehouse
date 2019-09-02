class ProductsController < ApplicationController
  require 'json'

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    delta = (product_params[:quantity].to_i - @product.quantity.to_i)
    new_art_quantities = {}

    @product.assemblies.each do |assembly|
      new_art_quantities.store(assembly.article_id, Article.find(assembly.article_id).stock + delta * assembly.amount_of)
    end
    if new_art_quantities.values.any?(&:negative?)
      flash[:alert] = "edit failed"
      redirect_to product_path(@product)
    end
    new_art_quantities.each {|key,value| Article.find(key).update(stock: value)}
    new_params = {name: product_params[:name], price: product_params[:price]}
    @product.update(new_params)
    flash[:alert] = "edit successful"
    redirect_to product_path(@product)
  end

  def update_sell
    @product = Product.find(params[:product][:product_id])
    redirect_to edit_product_path(@product)
  end

  def import
    filepath = params[:file].path
    items = JSON.parse(File.read(filepath))
    contains_products?(items) ? Product.import_products(items) : Article.import_articles(items)
    flash[:alert] = "import successful"
    redirect_to products_upload_url
  rescue
    flash[:alert] = "import failed"
    redirect_to products_upload_url
  end

  private

  def contains_products?(items)
    return !items["products"].nil?
  end

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end

end
