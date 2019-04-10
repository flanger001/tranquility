require "rails_helper"

RSpec.describe Snippet do
  describe "validations" do
    subject { object.valid? }

    describe "#title" do
      let(:object) { FactoryBot.build_stubbed(:snippet, :title => "Hello") }

      context "when title does not exist" do
        it { is_expected.to be(true) }
      end

      context "when title exists" do
        let!(:object_existing) { FactoryBot.create(:snippet, :title => "Hello") }

        it { is_expected.to be(false) }
      end
    end
  end
end
