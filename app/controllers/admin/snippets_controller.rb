module Admin
  class SnippetsController < Admin::BaseController
    private

    def resource_class
      Snippet
    end

    def resource_params
      params.require(:snippet).permit!
    end
  end
end
