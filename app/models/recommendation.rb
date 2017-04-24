class Recommendation < ActiveRecord::Base
  before_save :set_url
  validate :has_good_url?

  private

  def set_url
    if url.present?
      self.url = URI.parse(self.url).tap { |l| "#{l.scheme}://#{l.host}" }
    end
  end

  def has_good_url?
    if URI.parse(self.url).instance_of? URI::Generic
      errors.add(:url, 'Please enter a valid url starting with http:// or https://')
    end
  end
end
