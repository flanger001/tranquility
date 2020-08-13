module Url
  extend ActiveSupport::Concern
  included do
    before_save :create_url

    def to_param
      url
    end

    private

    def create_url
      self.url = Navigation::Url.create(self)
    end
  end
end
