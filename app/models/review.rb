# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  product_id :integer
#  active     :boolean          default(FALSE)
#  title      :string
#  author     :string
#  body       :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :product, counter_cache: true
  validates :rating,
            numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :product, presence: true
end
