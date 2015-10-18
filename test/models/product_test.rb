# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  name          :string
#  url           :string
#  description   :string
#  price         :integer
#  reviews_count :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  seo           :string
#  photo         :string
#  active        :boolean          default(FALSE)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
