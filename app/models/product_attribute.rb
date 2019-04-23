class ProductAttribute < ActiveRecord::Base
  belongs_to :product

  validates :price, :presence => true
end
