module CreateUrl
  extend ActiveSupport::Concern
  included do
    before_save :create_url

    private

    def create_url
      self.url = self.name.downcase.gsub(/[\W]{1,}/, '-')
      self.url.chop! if self.url.end_with?('-')
    end
  end
end
