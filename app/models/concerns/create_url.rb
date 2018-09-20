module CreateUrl
  extend ActiveSupport::Concern
  included do
    before_save :create_url

    private

    def create_url
      self.url = name.downcase.gsub(/[\W]{1,}/, '-')
      url.chop! if url.end_with?('-')
    end
  end
end
