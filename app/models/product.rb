class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true, :optional => true
  has_many :product_attributes, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  accepts_nested_attributes_for :product_attributes, :allow_destroy => true, :reject_if => :all_blank

  include Concerns::Url
  include Concerns::SeoTags
  include Concerns::Active

  acts_as_list :scope => :category

  scope :with_reviews, -> { includes(:reviews).where(arel_table[:reviews_count].gt(0)) }

  def average_rating
    reviews.average(:rating).to_i
  end

  mount_uploader :photo, ImageUploader
end
