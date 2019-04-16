require "rails_helper"

RSpec.describe Event do
  let(:schedule) { create(:schedule) }

  context "validations" do
    subject(:event) { build(:event, :schedule => schedule, :start_time => start_time, :end_time => end_time) }

    context "start_time and end_time" do
      around { |example| freeze_time { example.run } }

      context "given a start time" do
        let(:start_time) { Time.current }

        context "given a different end time" do
          let(:end_time) { Time.current + 1.hour }

          it { is_expected.to be_valid }
        end

        context "given the same end time" do
          let(:end_time) { start_time }

          it { is_expected.to_not be_valid }
        end
      end
    end

    context "#day" do
      subject(:event) { build(:event, :schedule => schedule, :day => day) }

      context "given no day" do
        let(:day) { nil }

        it { is_expected.to_not be_valid }
      end

      context "given correct day" do
        let(:day) { "Monday" }

        it { is_expected.to be_valid }
      end

      context "given incorrect day" do
        let(:day) { "Grunsday" }

        it { is_expected.to_not be_valid }
      end
    end
  end
end
