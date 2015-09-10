class AddActiveToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :active, :boolean, default: false
  end
end
