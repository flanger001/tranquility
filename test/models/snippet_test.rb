# == Schema Information
#
# Table name: snippets
#
#  id          :integer          not null, primary key
#  name        :string
#  title       :string
#  body        :text
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean          default(FALSE)
#

require 'test_helper'

class SnippetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
