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

class SnippetCollection < ActiveRecord::Base
  has_many :snippets
  belongs_to :category_collection, optional: true
end
