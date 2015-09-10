# == Schema Information
#
# Table name: categories
#
#  id                             :integer          not null, primary key
#  name                           :string
#  description                    :string
#  url                            :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  category_collection_id :integer
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
