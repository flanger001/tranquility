module Concerns
  module SeoTags
    extend ActiveSupport::Concern

    included do
      def seo_tags
        seo && seo.split(",").join
      end
    end
  end
end
