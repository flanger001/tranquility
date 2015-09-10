class Admin::ProductsController < Admin::BaseController

  private

  def resource_class
    Product
  end

  def resource_params
    params.require(:product).permit(:category_id, :name, :seo, :description, :price,
          { :product_attributes_attributes => [:id, :time, :price, :_destroy] })
  end
end
