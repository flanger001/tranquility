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

require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  def setup
    @attrs_with_valid_http_url = {
      name: 'Some name',
      description: 'This place is great and has a valid http url',
      url: 'http://www.greatwebsite.com'
    }

    @attrs_with_valid_https_url = {
      name: 'Some name',
      description: 'This place is even better and has a valid https url',
      url: 'https://www.awesomewebsite.com'
    }

    @attrs_with_invalid_url = {
      name: 'Some name',
      description: 'This place is not so great because of its invalid url',
      url:  'hrps:-//www.sadwebsite.com'
    }

    @attrs_with_incomplete_url = {
      name: 'Some name',
      description: 'This place would be better were it not for its incomplete url',
      url:  'www.okwebsite.com'
    }
    @recommendation = Recommendation.new
  end

  def test_should_pass_a_valid_http_url_as_is
    @recommendation.attributes = @attrs_with_valid_http_url
    @recommendation.save
    assert_equal @attrs_with_valid_http_url[:url], @recommendation.url
  end

  def test_should_pass_a_valid_https_url_as_is
    @recommendation.attributes = @attrs_with_valid_https_url
    @recommendation.save
    assert_equal @attrs_with_valid_https_url[:url], @recommendation.url
  end

  def test_should_fix_bad_urls
    fail "Does not work yet"
    @recommendation.attributes = @attrs_with_invalid_url
    @recommendation.save
    assert_equal 'http://www.sadwebsite.com', @recommendation.url
  end

  def test_should_normalize_incomplete_urls
    @recommendation.attributes = @attrs_with_incomplete_url
    @recommendation.save
    assert_equal 'http://www.okwebsite.com', @recommendation.url
  end

end
