require 'rails_helper'

RSpec.describe Staff, type: :model do
  before do
    @staff = build(:staff)
  end

  it 'should have first name' do
    expect(@staff.first_name).to_not be_empty
  end

  it 'should have last name' do
    expect(@staff.last_name).to_not be_empty
  end

  it 'should have full name' do
    expect(@staff.name).to eq("#{@staff.first_name} #{@staff.last_name}")
  end
end
