require "rails_helper"

RSpec.describe Admin::SchedulesController do
  let(:user) { create(:user, :admin) }
  let!(:schedule) { create(:schedule) }

  before { sign_in(user) }

  describe "#index" do
    it "fetches a list of schedules" do
      get admin_schedules_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a new schedule form" do
      get new_admin_schedule_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:schedule_attributes) { attributes_for(:schedule, :name => "Creating a new schedule") }

    it "creates schedule" do
      expect {
        post admin_schedules_path, :params => { :schedule => schedule_attributes }
      }.to change { Schedule.count }.by(1)
      expect(response).to redirect_to(admin_schedule_path(Schedule.last))
    end
  end

  describe "#show" do
    it "shows a schedule" do
      get admin_schedule_path(schedule)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "returns an edit schedule form" do
      get edit_admin_schedule_path(schedule)
      expect(response).to have_http_status(:success)
    end
  end

  context "#update" do
    let(:schedule_attributes) { attributes_for(:schedule) }

    it "updates a schedule" do
      expect { patch admin_schedule_path(schedule), :params => { :schedule => schedule_attributes } }.to change { schedule.reload.notes }
      expect(response).to redirect_to(admin_schedule_path(schedule))
    end
  end

  context "#destroy" do
    it "destroys a schedule" do
      expect {
        delete admin_schedule_path(schedule)
      }.to change { Schedule.count }.by(-1)
      expect(response).to redirect_to(admin_schedules_path)
    end
  end
end
