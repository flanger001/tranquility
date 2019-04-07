require "rails_helper"

RSpec.describe Staff do
  it { is_expected.to respond_to(:name) }

  describe "validations" do
    let(:staff) { build(:staff) }
    subject { staff.valid? }

    context "without first_name" do
      it "is invalid" do
        staff.first_name = nil
        expect(subject).to be(false)
      end
    end

    context "without last_name" do
      it "is invalid" do
        staff.last_name = nil
        expect(subject).to be(false)
      end
    end
  end
end
