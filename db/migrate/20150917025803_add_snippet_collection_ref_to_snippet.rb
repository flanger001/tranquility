class AddSnippetCollectionRefToSnippet < ActiveRecord::Migration
  def change
    add_reference :snippets, :snippet_collection
  end
end
