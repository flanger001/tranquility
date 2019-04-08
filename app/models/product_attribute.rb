class ProductAttribute < ActiveRecord::Base
  belongs_to :product, :optional => false

  validates :time, :price, :presence => true
end
