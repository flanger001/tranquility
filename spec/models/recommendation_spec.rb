require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  it 'is valid with a valid http url' do
    recommendation = build(:recommendation, :valid_http_url)
    expect(recommendation.valid?).to be(true)
  end

  it 'is valid with a valid https url' do
    recommendation = build(:recommendation, :valid_https_url)
    expect(recommendation.valid?).to be(true)
  end

  it 'is invalid with a bad url' do
    recommendation = build(:recommendation, :invalid_url)
    expect(recommendation.valid?).to be(false)
  end

  it 'is invalid with an incomplete url' do
    recommendation = build(:recommendation, :incomplete_url)
    expect(recommendation.valid?).to be(false)
  end
end
