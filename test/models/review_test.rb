# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  product_id :integer
#  active     :boolean          default(FALSE)
#  title      :string
#  author     :string
#  body       :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
