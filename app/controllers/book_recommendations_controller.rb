class BookRecommendationsController < ApplicationController

  def generate
    recommendations = BookRecommender.call(genres: params[:genres])

    render json: recommendations
  end
end
