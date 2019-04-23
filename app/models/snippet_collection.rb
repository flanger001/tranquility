class SnippetCollection < ActiveRecord::Base
  has_many :snippets, :dependent => :nullify
  belongs_to :category_collection, :optional => true
end
