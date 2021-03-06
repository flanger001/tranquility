class CategoryCollection < ActiveRecord::Base
  has_many :categories, :dependent => :nullify
  has_one :snippet_collection, :dependent => :nullify

  accepts_nested_attributes_for :categories, :snippet_collection

  validates :name, :presence => true

  include Url
  include SeoTags
  include Active

  acts_as_list
end
