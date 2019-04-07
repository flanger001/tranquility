class CategoryCollection < ActiveRecord::Base
  has_many :categories
  has_many :products, through: :categories
  has_one :snippet_collection

  accepts_nested_attributes_for :categories, :snippet_collection
  validates :name, presence: true

  include Concerns::Url
  include Concerns::SeoTags
  acts_as_list

  scope :active, -> { where(active: true) }
end
