class Recommendation < ActiveRecord::Base
  before_save :set_url
  validate :good_url?

  private

  def set_url
    self.url = URI.parse(url).tap { |l| "#{l.scheme}://#{l.host}" } if url.present?
  end

  def good_url?
    errors.add(:url, 'Please enter a valid url starting with http:// or https://') if URI.parse(url).instance_of?(URI::Generic)
  end
end
