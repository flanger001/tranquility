# == Schema Information
#
# Table name: categories
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :string
#  url                    :string
#  inline                 :boolean          default(FALSE), not null
#  products_count         :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_collection_id :integer
#  seo                    :string
#

class Category < ActiveRecord::Base
  belongs_to :category_collection
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products, allow_destroy: true

  include CreateUrl
  include SeoTags
end
