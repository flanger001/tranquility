module SeoTags

  def self.included(base)
    base.class_eval do
      def seo_tags
        seo && seo.split(',').join
      end
    end
  end
end
