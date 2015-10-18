# == Schema Information
#
# Table name: reviews
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  active             :boolean          default(FALSE)
#  title              :string
#  customer_name      :string
#  body               :text
#  rating             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  show_customer_name :boolean
#  date               :datetime
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
