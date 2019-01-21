module Concerns
  module SeoTags
    def seo_tags
      seo && seo.split(",").join
    end
  end
end
