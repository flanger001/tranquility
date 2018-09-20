class CategoryCollection < ActiveRecord::Base
  has_many :categories
  has_many :products, through: :categories
  has_one :snippet_collection
  accepts_nested_attributes_for :categories, :snippet_collection
  include CreateUrl
  include SeoTags
  acts_as_list
end
