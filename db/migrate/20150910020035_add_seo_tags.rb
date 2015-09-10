class AddSeoTags < ActiveRecord::Migration
  def change
    %i(products categories category_collections).each do |m|
      add_column m, :seo, :string
    end
  end
end
