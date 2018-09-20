class ProductAttribute < ActiveRecord::Base
  belongs_to :product, optional: false
end
