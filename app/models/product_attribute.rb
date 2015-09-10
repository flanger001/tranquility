# == Schema Information
#
# Table name: product_attributes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  time       :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductAttribute < ActiveRecord::Base
  belongs_to :product
end
