# == Schema Information
#
# Table name: category_collections
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  seo         :string
#  inline      :boolean          default(FALSE)
#  active      :boolean          default(FALSE)
#

require 'test_helper'

class CategoryCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
