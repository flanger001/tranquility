module Concerns
  module Url
    extend ActiveSupport::Concern
    included do
      before_save :create_url

      def to_param
        url
      end

      private

      def create_url
        self.url = NavigationUrl.create(self)
      end
    end
  end
end
