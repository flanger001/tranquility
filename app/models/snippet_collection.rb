class SnippetCollection < ActiveRecord::Base
  has_many :snippets
  belongs_to :category_collection, :optional => true
end
