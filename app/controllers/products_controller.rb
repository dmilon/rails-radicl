class ProductsController < ApplicationController
  def new
    @garden = current_user.garden
    @zones = Zone.all.where(garden: @garden)
    @elements = Element.all.where(zone: @zones)
    @product = Product.new
    authorize @product
  end

  def create
    @garden = current_user.garden
    @zones = Zone.all.where(garden: @garden)
    @elements = Element.all.where(zone: @zones)
    @product = Product.new(product_params)
    authorize @product
    raise
    if @product.save
      redirect_to garden_path(current_user.garden)
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:element_id, :quantity, :price, :description, :start_date, :end_date)
  end
end
