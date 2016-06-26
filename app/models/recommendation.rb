# == Schema Information
#
# Table name: recommendations
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  url         :string
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
    if URI.parse(self.url).is_a? URI::Generic
      errors.add(:url, 'Please enter a valid url starting with http:// or https://')
    end
  end
end
