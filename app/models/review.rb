class Review < ActiveRecord::Base
  belongs_to :product, :counter_cache => true
  validates :rating,
            :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }
  validates :product, :presence => true

  include Active

  def self.random
    order(Arel::Nodes::NamedFunction.new("RANDOM", [])).first
  end
end
