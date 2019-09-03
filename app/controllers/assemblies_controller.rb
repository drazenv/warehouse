class AssembliesController < ApplicationController
  def edit
    @assembly = Assembly.find(params[:id])
    @article = Article.find(@assembly.article_id)
    @product = Product.find(@assembly.product_id)
  end

  def update
    @assembly = Assembly.find(params[:id])
    @product = Product.find(params[:product_id])
    if assembly_params[:amount_of].to_i <= 0
      redirect_to edit_product_assembly_url(@product, @assembly), notice: "update failed"
    else
      @assembly.update(amount_of: assembly_params[:amount_of].to_i)
      redirect_to edit_product_url(@product)
    end
  end
end

private

def assembly_params
  params.require(:assembly).permit(:amount_of)
end
