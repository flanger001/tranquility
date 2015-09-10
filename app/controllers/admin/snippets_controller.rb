class Admin::SnippetsController < Admin::BaseController

  private

  def resource_class
    Snippet
  end

  def resource_params
    params.require(:snippet).permit(:name, :title, :body, :active, :category_id)
  end


end
