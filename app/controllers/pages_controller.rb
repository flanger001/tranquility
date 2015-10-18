class PagesController < ApplicationController

  def about
    render locals: {
      staff: Staff.order(:id).includes(:schedule)
    }
  end

  def reviews
    render locals: {
      products: Product.includes(:reviews).where('reviews_count > 0'),
      review_snippet: Snippet.find_by(title: 'Reviews')
    }
  end

  def recommendations
    render locals: {
      recommendations: Recommendation.where(active: true)
    }
  end

  def no_u_cannot_haz
    redirect_to '/403'
  end

end
