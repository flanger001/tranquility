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
      url: 'hrps:-//www.sadwebsite.com'
    }

    @attrs_with_incomplete_url = {
      name: 'Some name',
      description: 'This place would be better were it not for its incomplete url',
      url: 'www.okwebsite.com'
    }
    @recommendation = Recommendation.new
  end

  test 'is valid with a valid http url' do
    @recommendation.attributes = @attrs_with_valid_http_url
    @recommendation.save
    assert_equal @attrs_with_valid_http_url[:url], @recommendation.url
  end

  test 'is valid with a valid https url' do
    @recommendation.attributes = @attrs_with_valid_https_url
    @recommendation.save
    assert_equal @attrs_with_valid_https_url[:url], @recommendation.url
  end

  test 'is invalid with a bad url' do
    @recommendation.attributes = @attrs_with_invalid_url
    refute @recommendation.valid?
  end

  test 'is invalid with an incomplete url' do
    @recommendation.attributes = @attrs_with_incomplete_url
    refute @recommendation.valid?
  end
end
