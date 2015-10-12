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

  private

  def set_url
    if url.present?
      self.url = begin
        l = URI.parse(self.url)
        if l.scheme.present?
          if l.scheme != 'https'
            l.scheme = 'http'
            "#{l.scheme}://#{l.host}"
          else
            "#{l.scheme}://#{l.host}"
          end
        else
          "http://#{l}"
        end
      end
    end
  end

end
