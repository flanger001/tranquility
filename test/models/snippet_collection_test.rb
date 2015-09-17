# == Schema Information
#
# Table name: snippet_collections
#
#  id                     :integer          not null, primary key
#  name                   :string
#  title                  :string
#  description            :text
#  category_collection_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class SnippetCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
