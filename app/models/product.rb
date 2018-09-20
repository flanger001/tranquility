# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  name          :string
#  url           :string
#  description   :string
#  price         :integer
#  reviews_count :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  seo           :string
#  photo         :string
#  active        :boolean          default(FALSE)
#  position      :integer
#

class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true, optional: true
  has_many :product_attributes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :product_attributes, allow_destroy: true

  include CreateUrl
  include SeoTags
  acts_as_list scope: :category

  def average_rating
    reviews.average(:rating).to_i
  end

  mount_uploader :photo, ImageUploader
end
