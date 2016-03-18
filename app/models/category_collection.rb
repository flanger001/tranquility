# == Schema Information
#
# Table name: category_collections
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  seo         :string
#  inline      :boolean          default(FALSE)
#  active      :boolean          default(FALSE)
#  position    :integer
#

class CategoryCollection < ActiveRecord::Base
  has_many :categories
  has_many :products, through: :categories
  has_one :snippet_collection
  accepts_nested_attributes_for :categories, :snippet_collection
  include CreateUrl
  include SeoTags
  acts_as_list
end
