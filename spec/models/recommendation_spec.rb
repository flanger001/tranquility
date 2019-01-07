require "rails_helper"

RSpec.describe Recommendation do
  describe "validations" do
    let(:recommendation) { described_class.new(url: url) }
    subject { recommendation.valid? }

    context "with a valid http url" do
      let(:url) { "http://www.greatwebsite.com" }

      it { is_expected.to be(true) }
    end

    context "with a valid https url" do
      let(:url) { "https://www.awesomewebsite.com" }

      it { is_expected.to be(true) }
    end

    context "with a bad url" do
      let(:url) { "hrps:-//www.sadwebsite.com" }

      it { is_expected.to be(false) }
    end

    context "with an incomplete url" do
      let(:url) { "www.okwebsite.com" }

      it { is_expected.to be(false) }
    end
  end
end
