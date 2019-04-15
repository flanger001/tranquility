class ProductAttribute < ActiveRecord::Base
  belongs_to :product, :optional => false

  validates :price, :presence => true
end
