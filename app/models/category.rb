class Category < ActiveRecord::Base
  belongs_to :category_collection, :optional => true
  has_many :products, :dependent => :destroy
  accepts_nested_attributes_for :products, :allow_destroy => true

  include Concerns::Url
  include Concerns::SeoTags
  include Concerns::Active

  acts_as_list :scope => :category_collection

  mount_uploader :photo, ImageUploader
end
