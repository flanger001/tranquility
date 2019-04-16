module Admin
  class SnippetCollectionsController < Admin::BaseController
    private

    def resource_class
      SnippetCollection
    end

    def resource_params
      params.require(:snippet_collection).permit!
    end
  end
end
