class PagesController < ApplicationController

  def about
    render locals: {
      staff: Staff.order(:id).includes(:schedule)
    }
  end

  def reviews
    render locals: {
      products: Product.includes(:reviews).where('reviews_count > 0')
    }
  end

  def recommendations
    render locals: {
      recommendations: Recommendation.where(active: true)
    }
  end

end