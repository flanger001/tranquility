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
#

class CategoryCollection < ActiveRecord::Base
  has_many :categories
  accepts_nested_attributes_for :categories
  include CreateUrl
  include SeoTags

end
